<template>
    <div>
        <el-container>
            <el-header>
                <o-header></o-header>
            </el-header>
            <el-main>
                <router-view></router-view>
            </el-main>
        </el-container>
    </div>    
</template>

<script>
    import OHeader from './OHeader.vue';
    export default {
        components : {
            'o-header' : OHeader
        }
    }
</script>
