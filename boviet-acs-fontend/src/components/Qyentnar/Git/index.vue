<template>
  <div>
    <svg-icon icon-class="github" @click="goto" />
  </div>
</template>

<script>
export default {
  name: 'QyentnarGit',
  data() {
    return {
      url: 'https://github.com/qyentnar/boviet-vue.git'
    }
  },
  methods: {
    goto() {
      window.open(this.url)
    }
  }
}
</script>