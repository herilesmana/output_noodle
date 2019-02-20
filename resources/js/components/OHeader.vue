<template>
    <el-menu :default-active="activeIndex" class="el-menu-demo" mode="horizontal" @select="handleSelect">
      <el-menu-item index="/">Home</el-menu-item>
      <el-submenu index="2">
        <template slot="title">Master</template>
        <el-menu-item index="/users">Users</el-menu-item>
        <!-- <el-submenu index="2-4">
          <template slot="title">item four</template>
          <el-menu-item index="2-4-1">item one</el-menu-item>
          <el-menu-item index="2-4-2">item two</el-menu-item>
          <el-menu-item index="2-4-3">item three</el-menu-item>
        </el-submenu> -->
      </el-submenu>
      <el-submenu index="3">
        <template slot="title">Target</template>
        <el-menu-item index="/target/create">Create</el-menu-item>
        <el-menu-item index="/target/list">List</el-menu-item>
      </el-submenu>
    </el-menu>
</template>

<script>
  export default {
    data() {
      return {
        activeIndex: '1',
        activeIndex2: '1'
      };
    },
    methods: {
      handleSelect(key, keyPath) {
        this.$router.push(key);
      }
    }
  }
</script>
