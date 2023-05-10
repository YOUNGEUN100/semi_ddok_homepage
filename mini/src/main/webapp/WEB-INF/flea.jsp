<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

    <jsp:include page="/layout/head.jsp"></jsp:include>
    <jsp:include page="/layout/includePageVisual.jsp"></jsp:include>

    <style>
        /* style START */
        /* * {
            border: 1px dotted rgb(223, 60, 141);
        } */

        .container {
            width: 1200px;
            height: 100%;
            position: relative;
            margin: auto;
        }

        table,
        td {
            border: 1px dotted black;
            border-collapse: collapse;
            padding: 16px;
            table-layout: fixed;
        }

        #sale_flg {
            width: 100px;
        }

        #address {
            width: 200px;
        }

        #title {
            width: 570px;
        }

        #id {
            width: 100px;
        }

        #date {
            width: 150px;
        }

        .box1 {
            width: 1200px;
            margin: auto;
            margin-top: 20px;
        }

        .board_title h1 {
            display: inline-block;
        }

        select {
            width: 80px;
            float: right;
            background: url('https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Ft1.daumcdn.net%2Fcfile%2Ftistory%2F99761B495C84AA8716') no-repeat 95% 50%;
            padding: .8em .5em;
            border: none;
            border-radius: 0px;
            appearance: none;
        }

        .box2 {
            width: 1200px;
            margin: auto;
            margin-top: 70px;
        }

        .market_category {
            width: 1200px;
            text-align: center;
        }

        .category_btn {
            font-size: 20px;
            font-weight: bold;
            margin: 16px;
            width: 110px;
            height: 50px;
            border: none;
            border-radius: 50px;
            box-shadow: 0px 0px 20px 5px #e7e6e6;
            background-color: white;
        }

        .purchase_list {
            border: none;
            box-sizing: border-box;
            padding: 40px 40px;
            width: 1200px;
            margin-top: 20px;
            border-radius: 20px;
            box-shadow: 0px 0px 20px 5px #e7e6e6;
        }

        .donate_list {
            border: none;
            box-sizing: border-box;
            padding: 40px 40px;
            width: 1200px;
            margin-top: 20px;
            border-radius: 20px;
            box-shadow: 0px 0px 20px 5px #e7e6e6;
        }

        .open_detail {
            text-align: center;
            margin-top: 60px;
        }

        .open_detail button {
            border: none;
            width: 200px;
            height: 60px;
            border-radius: 20px;
            background-color: #999999;
            color: white;
            font-size: 20px;
            font-weight: bold;
        }


        /* style END */
    </style>


    <!-- pageContent -- START -->
    <div id="pageContent">
        <div id="app">
            <div class="wrapper">

                <div class="container">
                    <div class="market_category">
                        <button class="category_btn">중고판매</button>
                        <button class="category_btn">중고나눔</button>
                    </div>

                    <div class="box1">

                        <div class="board_title">
                            <h1>거래할 분을 찾고 있어요!</h1>
                            <select>
                                <option>최신순</option>
                                <option>조회수</option>
                            </select>
                        </div>

                        <div class="purchase_list">
                            <table>
                                <tr v-for="(item, index) in list">
                                    <template v-if="item.boardKind=='T_LAN'">
                                        <td id="sale_flg" v-if="item.finishYn=='N'" style="color : #5ea152">
                                            {{item.finish}}</td>
                                        <td id="sale_flg" v-else>{{item.finish}}</td>
                                        <td id="address">{{item.addr}}</td>
                                        <td id="title">{{item.title}}</td>
                                        <td id="id">{{item.nick}}</td>
                                        <td id="date">{{item.cdatetime}}</td>
                                    </template>

                                </tr>
                            </table>
                        </div>

                        <div class="open_detail">
                            <button>더보기</button>
                        </div>

                    </div>

                    <div class="box2">

                        <div class="board_title">
                            <h1>나눔할 분을 찾고 있어요!</h1>
                            <select>
                                <option>최신순</option>
                                <option>조회수</option>
                            </select>
                        </div>

                        <div class="donate_list">
                            <table>
                                <tr v-for="(item, index) in list">
                                    <template v-if="item.boardKind=='D_LAN'">
                                        <td id="sale_flg" v-if="item.finishYn=='N'" style="color : #5ea152">
                                            {{item.finish2}}</td>
                                        <td id="sale_flg" v-else>{{item.finish2}}</td>
                                        <td id="address">{{item.addr}}</td>
                                        <td id="title">{{item.title}}</td>
                                        <td id="id">{{item.nick}}</td>
                                        <td id="date">{{item.cdatetime}}</td>
                                    </template>

                                </tr>
                            </table>
                        </div>

                        <div class="open_detail">
                            <button>더보기</button>
                        </div>

                    </div>

                </div>

            </div>

        </div>

    </div>
    <!-- pageContent -- END -->

    <jsp:include page="/layout/tail.jsp"></jsp:include>


    <script type="text/javascript">
        var app = new Vue({
            el: '#app',
            data: {
                list: []
                , finish: ""
                , finish2: ""
            }
            , methods: {
                fnGetList: function () {
                    var self = this;
                    var nparmap = {};
                    $.ajax({
                        url: "/lanmarket/list.dox",
                        dataType: "json",
                        type: "POST",
                        data: nparmap,
                        success: function (data) {
                            self.list = data.list;
                            for (var i = 0; i < self.list.length; i++) {
                                if (self.list[i].finishYn == 'N') {
                                    self.list[i].finish = '판매중';
                                    self.list[i].finish2 = '나눔중';
                                } else if (self.list[i].finishYn == 'Y') {
                                    self.list[i].finish = '판매완료';
                                    self.list[i].finish2 = '나눔완료';
                                }
                            }
                            console.log(data.list);
                        }
                    });
                }


            }
            , created: function () {
                this.fnGetList();
            }
        });
    </script>