<template>
  <el-dialog
    :visible.sync="dialogVisible"
    :title="title"
    :width="width"
    :before-close="handleClose"
    class="yaml-editor-dialog"
  >
    <div class="yaml-editor">
      <div class="editor-container">
        <codemirror 
          ref="cmEditor"
          v-model="internalValue" 
          :options="mergedOptions"
          @input="handleChange"
          @ready="onEditorReady"
        />
      </div>
      <div v-if="yamlError" class="yaml-error">
        <el-alert :title="yamlError" type="error" :closable="false" show-icon />
      </div>
      <div class="editor-toolbar" v-if="showToolbar">
        <el-button-group>
          <el-button 
            size="mini" 
            icon="el-icon-magic-stick"
            @click="formatCode"
            :title="$t('Format YAML')"
          />
          <el-button 
            size="mini" 
            icon="el-icon-document-copy"
            v-clipboard:copy="internalValue"
            v-clipboard:success="onCopySuccess"
            :title="$t('Copy content')"
          />
          <el-button 
            size="mini" 
            icon="el-icon-upload2"
            @click="$refs.fileInput.click()"
            :title="$t('Import file')"
          />
        </el-button-group>
        <input 
          type="file" 
          ref="fileInput"
          accept=".yaml,.yml"
          style="display:none"
          @change="handleFileUpload"
        >
      </div>
    </div>
    <span slot="footer" class="dialog-footer">
      <el-button @click="handleCancel">{{ $t('Cancel') }}</el-button>
      <el-button type="primary" @click="handleConfirm">{{ $t('Confirm') }}</el-button>
    </span>
  </el-dialog>
</template>

<script>
import { codemirror } from 'vue-codemirror'
import "codemirror/mode/yaml/yaml.js"
import 'codemirror/theme/darcula.css'
import 'codemirror/addon/lint/lint.css'
import 'codemirror/addon/lint/lint'
import 'codemirror/addon/lint/yaml-lint'
import jsyaml from 'js-yaml'

window.jsyaml = jsyaml

export default {
  name: 'YamlEditor',
  components: {
    codemirror
  },
  props: {
    visible: {
      type: Boolean,
      default: false
    },
    value: {
      type: String,
      default: ''
    },
    options: {
      type: Object,
      default: () => ({})
    },
    showToolbar: {
      type: Boolean,
      default: true
    },
    title: {
      type: String,
      default: 'YAML Editor'
    },
    width: {
      type: String,
      default: '60%'
    }
  },
  data() {
    return {
      dialogVisible: false,
      internalValue: '',
      yamlError: null,
      defaultOptions: {
        mode: 'text/x-yaml',
        theme: 'darcula',
        line: true,
        lineNumbers: true,
        styleActiveLine: true,
        lineWrapping: true,
        lint: true,
        gutters: ['CodeMirror-lint-markers'],
        tabSize: 2,
        indentWithTabs: false,
        fontSize: '14px',
        viewportMargin: Infinity,
        extraKeys: {
          'Ctrl-Space': 'autocomplete'
        },
        // Add custom CSS styles
        styles: [
          '.CodeMirror { font-size: 14px; font-family: "Monaco", "Menlo", "Ubuntu Mono", "Consolas", monospace; }'
        ]
      }
    }
  },
  computed: {
    mergedOptions() {
      return { ...this.defaultOptions, ...this.options }
    },
    editor() {
      return this.$refs.cmEditor?.codemirror
    }
  },
  watch: {
    visible: {
      handler(val) {
        this.dialogVisible = val
      },
      immediate: true
    },
    dialogVisible(val) {
      this.$emit('update:visible', val)
    },
    value: {
      handler(newVal) {
        if (newVal !== this.internalValue) {
          this.internalValue = newVal
        }
      },
      immediate: true
    }
  },
  methods: {
    handleChange(value) {
      this.internalValue = value
      this.validateYaml(value)
      this.$emit('input', value)
      this.$emit('change', value)
    },
    validateYaml(content) {
      try {
        jsyaml.load(content)
        this.yamlError = null
        return true
      } catch (e) {
        this.yamlError = `Line ${e.mark?.line + 1}: ${e.message}`
        return false
      }
    },
    formatCode() {
      try {
        const parsed = jsyaml.load(this.internalValue)
        this.internalValue = jsyaml.dump(parsed, {
          indent: 2,
          lineWidth: -1,
          noRefs: true,
          sortKeys: false
        })
        this.$emit('input', this.internalValue)
      } catch (e) {
        this.$message.error(this.$t('Invalid YAML format'))
      }
    },
    onCopySuccess() {
      this.$message.success(this.$t('Copied successfully'))
    },
    handleFileUpload(event) {
      const file = event.target.files[0]
      if (!file) return
      
      const reader = new FileReader()
      reader.onload = (e) => {
        this.internalValue = e.target.result
        this.handleChange(this.internalValue)
      }
      reader.readAsText(file)
      event.target.value = '' // Reset file input
    },
    onEditorReady(cm) {
      this.$emit('ready', cm)
    },
    handleClose() {
      if (this.yamlError) {
        this.$confirm(
          this.$t('There are validation errors. Are you sure you want to close?'),
          this.$t('Warning'),
          {
            type: 'warning'
          }
        ).then(() => {
          this.dialogVisible = false
        }).catch(() => {})
      } else {
        this.dialogVisible = false
      }
    },
    handleCancel() {
      this.dialogVisible = false
      this.$emit('cancel')
    },
    handleConfirm() {
      if (this.yamlError) {
        this.$message.error(this.$t('Please fix YAML errors before confirming'))
        return
      }
      this.$emit('confirm', this.internalValue)
      this.dialogVisible = false
    }
  }
}
</script>

<style lang="scss">
.yaml-editor-dialog {
  .el-dialog__body {
    padding: 10px 20px;
  }
  
  .yaml-editor {
    position: relative;
    
    .editor-container {
      border: 1px solid #dcdfe6;
      border-radius: 4px;
      
      .CodeMirror {
        height: 400px;
        font-size: 14px !important;
        font-family: 'Monaco', 'Menlo', 'Ubuntu Mono', 'Consolas', monospace;
        line-height: 1.5;
        letter-spacing: 0.5px;
      }
      
      .CodeMirror-code {
        font-size: inherit;
      }
    }
    
    .yaml-error {
      margin-top: 8px;
    }
    
    .editor-toolbar {
      position: absolute;
      top: 8px;
      right: 8px;
      z-index: 4;
      opacity: 0.6;
      transition: opacity 0.3s;
      
      &:hover {
        opacity: 1;
      }
    }
  }
}
</style>