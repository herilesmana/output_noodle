<template>
    <div>
        <el-container>
            <el-header>
                <el-menu class="el-menu-demo" mode="horizontal" style="height: 50px">
                    <el-row>
                        <el-col :span="4">
                            <img src="images/logo.png" alt="PT. PAS" height="45px">
                        </el-col>
                        <el-col :span="16" style="text-align: center">
                            <span style="font-size: 30px">Display Output Noodle 1</span><i style="font-size: 10px"> v.1.0</i>
                        </el-col>
                        <el-col :span="4">
                            <span class="jam" style="font-size: 20px">{{ jam }}</span><br>
                            <span class="tanggal">{{ tanggal }}</span>
                        </el-col>
                    </el-row>
                </el-menu>
            </el-header>
            <el-main>
                <el-row class="variant variant-header">
                    <el-col class="variant-item" :span="8">Variant</el-col>
                    <el-col class="variant-item" :span="4">Periode</el-col>
                    <el-col class="variant-item" :span="4">Target</el-col>
                    <el-col class="variant-item" :span="4">Actual</el-col>
                    <el-col class="variant-item" :span="4">Achievement</el-col>
                </el-row>
                <span v-show="tampil">{{ no = 0 }}</span>
                <el-row class="variant" v-for="achievement in achievements" :key="achievement.id">
                    <el-col class="variant-item" :span="8">{{ achievement.nama_variant }}</el-col>
                    <el-col class="variant-item" :span="4">{{ achievement.start_date }} - {{ achievement.end_date }}</el-col>
                    <el-col class="variant-item" :span="4">
                        {{ achievement.barcode_variant }} -
                        {{ target[achievement.barcode_variant] }}
                    </el-col>
                    <el-col class="variant-item" :span="4">{{ actual[no] }}</el-col>
                    <el-col class="variant-item" :span="4">{{ getPersentase(target[achievement.barcode_variant],actual[no]) }} %</el-col>
                    <span v-show="tampil">{{ no ++ }}</span>
                </el-row>
            </el-main>
        </el-container>
    </div>
</template>

<style scoped>
    .variant {
        border-bottom: 1px solid #999;
        border-right: 1px solid #999;
    }
    .variant .variant-item {
        border-left: 1px solid #999;
        padding: 10px;
        padding-top: 20px;
        padding-bottom: 20px;
    }
    .variant.variant-header {
        border-top: 1px solid #999;
        border-bottom: 2px solid #999;
    }
    .variant.variant-header .variant-item {
        text-align: center;
        font-weight: bold;
    }
</style>

<script>
    export default {
        data () {
            return {
                tampil: false,
                target: [],
                actual: [],
                myachievement : [],
                getting_date : '',
                jam : '00:00',
                tanggal : '00 Januari 0000',
                achievements : []
            }
        },
        mounted: function () {
            this.getAchievements();
            this.setTglJam();
            // this.getAchievement(18998866200315);
        },
        methods: {
            getPersentase : function (target, actual)
            {
                var hasil = (actual / target) * 100 ;
                // console.log(hasil);
                return hasil;
            },
            getAchievements : function ()
            {
                var vm = this;
                axios.get('api/display/get_achievements')
                .then( function ( response ) {
                    // console.log( response.data );
                    vm.achievements = response.data;
                    vm.actual = [];
                    for (var i = 0; i < vm.achievements.length; i++) {
                        vm.target[vm.achievements[i].barcode_variant] = vm.achievements[i].target;
                        if (i < 2) {
                            vm.getAchievement(vm.achievements[i].barcode_variant);
                        }
                        console.log(vm.actual);
                    }
                })
                .catch( function ( error ) {
                    console.log( error )
                })
            },
            getAchievement : function (barcode)
            {
                var vm = this;
                axios.get('api/display/get_achievement/'+barcode)
                .then( function ( response ) {
                    // vm.myachievement = JSON.stringify(response.data.barcode);
                    // console.log( barcode + ' +- ' + JSON.stringify(response.data.barcode) );
                    vm.actual.push(response.data.barcode+' - '+response.data.nobatch);
                     // console.log(vm.actual);
                })
                .catch( function ( error ) {
                    console.log( error )
                })
            },
            setTime : function ( time )
            {
                if (time < 10) {
                   return '0'+time;
                }
                return time;
            },
            setTglJam : function ()
            {
                var vm = this;
                this.getting_date = setInterval(function() {
                    var date = new Date();
                    var h = vm.setTime(date.getHours());
                    var i = vm.setTime(date.getMinutes());
                    var s = vm.setTime(date.getSeconds());
                    var d = vm.setTime(date.getDate());
                    var dateString = date.toString();
                    var arrDate = dateString.split(' ');
                    var htmlDate = arrDate[0] + ", " + arrDate[2] + " " + arrDate[1] + " " + arrDate[3];
                    vm.jam = h+':'+i+':'+s;
                    vm.tanggal = htmlDate;
                 }, 1000);
            }
        }
    }
</script>
