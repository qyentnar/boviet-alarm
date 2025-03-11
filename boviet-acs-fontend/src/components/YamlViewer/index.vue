<template>
  <el-drawer
    :visible.sync="drawerVisible"
    :title="title"
    :size="width"
    :direction="direction"
    class="yaml-viewer-drawer"
  >
    <div class="yaml-viewer">
      <div class="viewer-container">
        <codemirror 
          ref="cmViewer"
          v-model="internalValue" 
          :options="mergedOptions"
          @ready="onViewerReady"
        />
      </div>
      <div class="viewer-toolbar" v-if="showToolbar">
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
            icon="el-icon-download"
            @click="downloadYaml"
            :title="$t('Download YAML')"
          />
        </el-button-group>
      </div>
    </div>
  </el-drawer>
</template>

<script>
import { codemirror } from 'vue-codemirror'
import "codemirror/mode/yaml/yaml.js"
import 'codemirror/theme/darcula.css'
import jsyaml from 'js-yaml'

export default {
  name: 'YamlViewer',
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
    title: {
      type: String,
      default: 'YAML Viewer'
    },
    width: {
      type: String,
      default: '50%'
    },
    direction: {
      type: String,
      default: 'rtl',
      validator: (value) => ['ltr', 'rtl', 'ttb', 'btt'].includes(value)
    },
    showToolbar: {
      type: Boolean,
      default: true
    },
    fileName: {
      type: String,
      default: 'document.yaml'
    }
  },
  data() {
    return {
      drawerVisible: false,
      internalValue: '',
      defaultOptions: {
        mode: 'text/x-yaml',
        theme: 'darcula',
        lineNumbers: true,
        lineWrapping: true,
        readOnly: true,
        fontSize: '14px',
        viewportMargin: Infinity
      }
    }
  },
  computed: {
    mergedOptions() {
      return { ...this.defaultOptions }
    }
  },
  watch: {
    visible: {
      handler(val) {
        this.drawerVisible = val
      },
      immediate: true
    },
    drawerVisible(val) {
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
    formatCode() {
      try {
        const parsed = jsyaml.load(this.internalValue)
        this.internalValue = jsyaml.dump(parsed, {
          indent: 2,
          lineWidth: -1,
          noRefs: true,
          sortKeys: false
        })
      } catch (e) {
        this.$message.error(this.$t('Invalid YAML format'))
      }
    },
    onCopySuccess() {
      this.$message.success(this.$t('Copied successfully'))
    },
    downloadYaml() {
      const blob = new Blob([this.internalValue], { type: 'text/yaml' })
      const url = window.URL.createObjectURL(blob)
      const link = document.createElement('a')
      link.href = url
      link.setAttribute('download', this.fileName)
      document.body.appendChild(link)
      link.click()
      document.body.removeChild(link)
      window.URL.revokeObjectURL(url)
    },
    onViewerReady(cm) {
      this.$emit('ready', cm)
    }
  }
}
</script>

<style lang="scss">
.yaml-viewer-drawer {
  .el-drawer__body {
    padding: 10px 20px;
  }

  .yaml-viewer {
    position: relative;
    height: 100%;
    
    .viewer-container {
      height: calc(100% - 20px);
      border: 1px solid #dcdfe6;
      border-radius: 4px;
      
      .CodeMirror {
        height: 100%;
        font-size: 14px !important;
        font-family: 'Monaco', 'Menlo', 'Ubuntu Mono', 'Consolas', monospace;
        line-height: 1.5;
        letter-spacing: 0.5px;
      }
      
      .CodeMirror-code {
        font-size: inherit;
      }
    }
    
    .viewer-toolbar {
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