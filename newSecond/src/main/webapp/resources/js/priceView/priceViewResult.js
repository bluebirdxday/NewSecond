/* --------------------------------------------------------------- */
/* chartjs */

var month1 = document.getElementById("month1").innerText;
var month2 = document.getElementById("month2").innerText;
var month3 = document.getElementById("month3").innerText;

// 차트 데이터 설정
var chartData = {
    labels: ["3개월 전", "2개월 전", "최근 1개월"],
    datasets: [{
        label: '최근 가격 추이',
        data: [month3, month2, month1],
        borderColor: '#2365B9', // 곡선 색
        backgroundColor: 'white', // 점 색
        tension: 0.4, // 곡선의 강도 조절 (0에 가까울수록 직선에 가까워짐)
    }]
};

// 차트 생성
// 최대값과 최소값의 중간값 계산
var minValue = Math.min(...chartData.datasets[0].data);
var maxValue = Math.max(...chartData.datasets[0].data);
var midValue = Math.trunc((minValue + maxValue) / 2, -2);

// 중간 선을 위한 데이터 준비
var midLineData = Array(chartData.datasets[0].data.length).fill(midValue);

// 차트 생성
var ctx = document.getElementById('myChart').getContext('2d');
var myChart = new Chart(ctx, {
    type: 'line',
    data: chartData,
    options: {
        responsive: true,
        maintainAspectRatio: false, // 차트의 크기를 고정하지 않음
        scales: {
            y: {
                beginAtZero: false, // y축의 시작점을 0이 아닌 최소값으로 설정
                grid: {
                    drawBorder: false, // y축 그리드 라인 제거
                    drawOnChartArea: false // y축 그리드 라인이 차트 영역 내부에 그려지지 않도록 설정
                },
                ticks: {
                    stepSize: 50000 // y축의 간격 설정
                }
            }
        },
        plugins: {
            legend: {
                display: true // 범례 숨김
            },
            tooltip: {
                enabled: true // 툴팁 숨김
            }
        },
        layout: {
            padding: {
                top: 20,
                right: 20,
                bottom: 20,
                left: 20
            }
        },
        annotation: {
            annotations: [{
                type: 'line',
                mode: 'horizontal',
                scaleID: 'y',
                value: midValue,
                borderColor: '#FF0000',
                borderWidth: 2,
                label: {
                    enabled: true,
                    content: '중간선',
                    position: 'right'
                }
            }]
        }
    }
});


/* --------------------------------------------------------------- */