<template>
    <div>
        <el-row>
            <el-col :span="24" style="margin-bottom: 20px">
                <el-alert
                    v-show="success"
                    title="Achievement Created"
                    type="success"
                    show-icon>
                </el-alert>
            </el-col>
            <el-col :span="12">
                <el-form ref="form" :model="target" label-width="120px">
                    <el-form-item
                    label="Tanggal">
                        <el-date-picker
                          v-model="target.tanggal"
                          type="daterange"
                          align="right"
                          unlink-panels
                          range-separator="To"
                          start-placeholder="Start date"
                          end-placeholder="End date"
                          :picker-options="pickerOptions">
                        </el-date-picker>
                    </el-form-item>
                    <el-form-item
                    label="Variant">
                        <el-select
                            v-model="target.variant"
                            placeholder="Variant.">
                            <el-option
                              v-for="variant in variants"
                              :key="variant.MID"
                              :label="variant.name"
                              :value="variant.MID" >
                            </el-option>
                          </el-select>
                    </el-form-item>
                    <el-form-item
                    label="Target">
                        <el-col :span="5">
                            <el-input autofocus="" v-model="target.value" placeholder="Target value"></el-input>
                        </el-col>
                    </el-form-item>
                    <el-form-item>
                        <el-button type="primary" @click="createTarget">Create</el-button>
                    </el-form-item>
                </el-form>
            </el-col>
        </el-row>
    </div>
</template>

<script>
    export default {
        data () {
            return {
                success : false,
                list : [],
                loading : false,
                variants : [],
                target : {
                    tanggal : [],
                    value: '',
                    variant: ''
                },
                pickerOptions: {
                  shortcuts: [{
                    text: 'Last week',
                    onClick(picker) {
                      const end = new Date();
                      const start = new Date();
                      start.setTime(start.getTime() - 3600 * 1000 * 24 * 7);
                      picker.$emit('pick', [start, end]);
                    }
                  }, {
                    text: 'Last month',
                    onClick(picker) {
                      const end = new Date();
                      const start = new Date();
                      start.setTime(start.getTime() - 3600 * 1000 * 24 * 30);
                      picker.$emit('pick', [start, end]);
                    }
                  }, {
                    text: 'Last 3 months',
                    onClick(picker) {
                      const end = new Date();
                      const start = new Date();
                      start.setTime(start.getTime() - 3600 * 1000 * 24 * 90);
                      picker.$emit('pick', [start, end]);
                    }
                  }]
                }
            }
        },
        mounted: function () {
            this.getVariant();
        },
        methods: {
            getVariant : function ()
            {
                var vm = this;
                axios.get('api/variant')
                .then( function ( response ) {
                    vm.variants = response.data;
                })
                .catch( function ( error ) {
                    console.log( error );
                })
            },
            createTarget : function ()
            {
                var vm = this;
                var start_date = moment(vm.target.tanggal[0]).format('YYYY-MM-DD');
                var end_date = moment(vm.target.tanggal[1]).format('YYYY-MM-DD')
                axios.post('api/achievement', {
                    target : vm.target.value,
                    start_date : start_date,
                    end_date : end_date,
                    variant : vm.target.variant
                })
                .then( function ( response ) {
                    if ( response.data.success == 1) {
                        vm.saveSuccess();
                    }
                })
                .catch( function ( error ) {
                    console.log( error );
                })
            },
            saveSuccess : function ()
            {
                this.target.value = '';
                this.target.variant = '';
                this.success = true;
            }
            // remoteMethod(query) {
            //     if (query !== '') {
            //       this.loading = true;
            //       setTimeout(() => {
            //         this.loading = false;
            //         this.variants = this.list.filter(item => {
            //           return item.label.toLowerCase()
            //             .indexOf(query.toLowerCase()) > -1;
            //         });
            //       }, 200);
            //     } else {
            //       this.variants = [];
            //     }
            // }
        }
    }
</script>
