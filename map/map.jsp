<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.json.JSONObject"%>
<%@ include file="/WEB-INF/views/nav.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Map Page</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>
    <%
        String jsonStr = (String) request.getAttribute("jsonStr");
        if (jsonStr != null) {
            JSONObject jsonData = new JSONObject(jsonStr);
            JSONObject cityData = jsonData.getJSONObject("SeoulRtd.citydata");
            JSONObject livePpltnStts = cityData.getJSONObject("CITYDATA").getJSONObject("LIVE_PPLTN_STTS").getJSONObject("LIVE_PPLTN_STTS");
          JSONObject livePpltnSttw = cityData.getJSONObject("CITYDATA").getJSONObject("WEATHER_STTS").getJSONObject("WEATHER_STTS");
            String ppltnTime = livePpltnStts.getString("PPLTN_TIME");
            String ppcongest = livePpltnStts.getString("AREA_CONGEST_LVL");
            String ppcongestmsg = livePpltnStts.getString("AREA_CONGEST_MSG");
           String pcpmsg = livePpltnSttw.getString("PCP_MSG");
            double pprate10 = livePpltnStts.getDouble("PPLTN_RATE_10");
            double pprate20 = livePpltnStts.getDouble("PPLTN_RATE_20");
            double pprate30 = livePpltnStts.getDouble("PPLTN_RATE_30");
            double pprate40 = livePpltnStts.getDouble("PPLTN_RATE_40");
            double pprate50 = livePpltnStts.getDouble("PPLTN_RATE_50");
            double pprate60 = livePpltnStts.getDouble("PPLTN_RATE_60");
            double pprate70 = livePpltnStts.getDouble("PPLTN_RATE_70");
       double sensible = livePpltnSttw.getDouble("SENSIBLE_TEMP");
       double max_w = livePpltnSttw.getDouble("MAX_TEMP");
       double max_y = livePpltnSttw.getDouble("MIN_TEMP");
    %>
        <div>
            <p>데이터 가져온 시간: <%= ppltnTime %></p>
            <canvas id="myChart" width="400" height="200"></canvas>
            <p>혼잡도: <%= ppcongest %>, <%= ppcongestmsg %></p>
            <p>오늘 최고온도: <%= max_w %>°C, 최저온도: <%= max_y %>°C, 체감온도 <%= sensible %>°C</p>
          <p>비,눈관련예보: <%= pcpmsg %></p>
        </div>

        <script>
            var ctx = document.getElementById('myChart').getContext('2d');
            var myChart = new Chart(ctx, {
                type: 'bar',
                data: {
                    labels: ['10대', '20대', '30대', '40대', '50대', '60대', '70대'],
                    datasets: [{
                        label: '인구 비율',
                        data: [<%= pprate10 %>, <%= pprate20 %>, <%= pprate30 %>, <%= pprate40 %>, <%= pprate50 %>, <%= pprate60 %>, <%= pprate70 %>],
                        backgroundColor: 'rgba(75, 192, 192, 0.2)',
                        borderColor: 'rgba(75, 192, 192, 1)',
                        borderWidth: 1
                    }]
                },
                options: {
                    scales: {
                        y: {
                            beginAtZero: true
                        }
                    }
                }
            });
        </script>
    <%
        } else {
    %>
        <div>
            No JSON content available.
        </div>
    <%
        }
    %>
</body>
</html>