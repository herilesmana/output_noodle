<template>
    <div>
        <el-table
            :data="achievements"
            style="width: 100%">
            <el-table-column
                prop="start_date"
                label="Start Date">
            </el-table-column>
            <el-table-column
                prop="end_date"
                label="End Date">
            </el-table-column>
            <el-table-column
                prop="nama_variant"
                label="Variant">
            </el-table-column>
            <el-table-column
                prop="target"
                label="Target">
            </el-table-column>
            <el-table-column
                prop="actual"
                label="Actual">
            </el-table-column>
            <el-table-column
                prop="action"
                label="Action">
            </el-table-column>
        </el-table>
    </div>
</template>

<script>
    export default {
        data () {
            return {
                achievements : []
            }
        },
        mounted : function () {
            this.getAchievements();
        },
        methods : {
            getAchievements : function () {
                var vm = this;
                axios.get('api/achievement')
                .then( function ( response ) {
                    vm.achievements = response.data;
                })
                .catch( function ( error ) {
                    console.log( error );
                })
            }
        }
    }
</script>
