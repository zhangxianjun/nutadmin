<!DOCTYPE html>
<html lang="en" style="height: 100%">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <script src="./js/jquery-3.4.1.min.js"></script>
    <script src="/js/vue.js"></script>
    <link rel="stylesheet" href="/element/element.css">
    <script src="/element/element.js"></script>
    <style>
        .el-header {
            font-size: 12px;
            background-color: #eee;
            color: #333;
        }

        span {
            line-height: 50px;
        }
    </style>
</head>
<body>

<div id="app">
    <el-container>
        <el-header height="50px">

            <el-row type="flex" class="row-bg" justify="space-between">
                <el-col :span="6">
                    <span style="margin-left: 20px">管理系统</span>
                </el-col>
                <el-col :span="6" style="text-align: right">
                    <div>
                        <el-dropdown style="">
                            <i class="el-icon-setting" style="margin-right: 15px"></i>
                            <el-dropdown-menu slot="dropdown">
                                <el-dropdown-item>查看</el-dropdown-item>
                                <el-dropdown-item>新增</el-dropdown-item>
                                <el-dropdown-item>删除</el-dropdown-item>
                            </el-dropdown-menu>
                        </el-dropdown>
                        <span>王小虎</span>
                    </div>
                </el-col>
            </el-row>

        </el-header>

        <el-aside width="200px" style="height: calc(100% - 60px)">
            <el-menu :default-openeds="['1']">
                <el-submenu index="1">
                    <template slot="title"><i class="el-icon-message"></i>导航一</template>
                    <el-menu-item-group>
                        <template slot="title">分组一</template>
                        <el-menu-item index="1-1">选项1</el-menu-item>
                        <el-menu-item index="1-2">选项2</el-menu-item>
                    </el-menu-item-group>
                    <el-menu-item-group title="分组2">
                        <el-menu-item index="1-3">选项3</el-menu-item>
                    </el-menu-item-group>
                    <el-submenu index="1-4">
                        <template slot="title">选项4</template>
                        <el-menu-item index="1-4-1">选项4-1</el-menu-item>
                    </el-submenu>
                </el-submenu>
                <el-submenu index="2">
                    <template slot="title"><i class="el-icon-menu"></i>导航二</template>
                    <el-menu-item-group>
                        <template slot="title">分组一</template>
                        <el-menu-item index="2-1">选项1</el-menu-item>
                        <el-menu-item index="2-2">选项2</el-menu-item>
                    </el-menu-item-group>
                    <el-menu-item-group title="分组2">
                        <el-menu-item index="2-3">选项3</el-menu-item>
                    </el-menu-item-group>
                    <el-submenu index="2-4">
                        <template slot="title">选项4</template>
                        <el-menu-item index="2-4-1">选项4-1</el-menu-item>
                    </el-submenu>
                </el-submenu>
                <el-submenu index="3">
                    <template slot="title"><i class="el-icon-setting"></i>导航三</template>
                    <el-menu-item-group>
                        <template slot="title">分组一</template>
                        <el-menu-item index="3-1">选项1</el-menu-item>
                        <el-menu-item index="3-2">选项2</el-menu-item>
                    </el-menu-item-group>
                    <el-menu-item-group title="分组2">
                        <el-menu-item index="3-3">选项3</el-menu-item>
                    </el-menu-item-group>
                    <el-submenu index="3-4">
                        <template slot="title">选项4</template>
                        <el-menu-item index="3-4-1">选项4-1</el-menu-item>
                    </el-submenu>
                </el-submenu>
            </el-menu>
        </el-aside>

        <el-container>


<#--            <el-main>-->
<#--                <el-table :data="tableData">-->
<#--                    <el-table-column prop="date" label="日期" width="140">-->
<#--                    </el-table-column>-->
<#--                    <el-table-column prop="name" label="姓名" width="120">-->
<#--                    </el-table-column>-->
<#--                    <el-table-column prop="address" label="地址">-->
<#--                    </el-table-column>-->
<#--                </el-table>-->
<#--            </el-main>-->
        </el-container>
    </el-container>
</div>
</body>
<script>
    $(function () {

        let viewModel = {
            name : "about"
        };

        let app = new Vue({
            el: '#app',
            data: viewModel,
            methods: {
                addItem() {

                },
                login: function (event) {
                    window.location.href = "home";
                }
            }
        });
    });
</script>
</html>