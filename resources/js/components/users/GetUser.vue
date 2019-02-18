<template>
    <div>
        <el-table
            :data="users"
            style="width: 100%">
            <el-table-column
                prop="NIK"
                label="NIK">
            </el-table-column>
            <el-table-column
                prop="name"
                label="Name">
            </el-table-column>
            <el-table-column
                prop="email"
                label="Email">
            </el-table-column>
            <el-table-column
                prop="status"
                label="status">
            </el-table-column>
        </el-table>
    </div>
</template>

<script>
    export default {
        data () {
            return {
                users : []
            }
        },
        mounted : function () {
            this.getUser();
        },
        methods : {
            getUser : function () {
                var vm = this;
                axios.get('api/user')
                .then( function ( response ) {
                    vm.users = response.data;
                })
                .catch( function ( error ) {
                    console.log( error );
                })
            }
        }
    }
</script>
