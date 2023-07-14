<template>
  <Bar id="my-chart-id" v-if="loaded" :data="chartData" />
</template>

<script>
import { Bar } from "vue-chartjs";
import {
  Chart as ChartJS,
  Title,
  Tooltip,
  Legend,
  BarElement,
  CategoryScale,
  LinearScale,
} from "chart.js";

ChartJS.register(
  Title,
  Tooltip,
  Legend,
  BarElement,
  CategoryScale,
  LinearScale
);
let width, height, gradient;
function getGradient(ctx, chartArea) {
  const chartWidth = chartArea.right - chartArea.left;
  const chartHeight = chartArea.bottom - chartArea.top;
  if (!gradient || width !== chartWidth || height !== chartHeight) {
    // Create the gradient because this is either the first render
    // or the size of the chart has changed
    width = chartWidth;
    height = chartHeight;
    gradient = ctx.createLinearGradient(0, chartArea.bottom, 0, chartArea.top);
    gradient.addColorStop(0.7, "rgba(72,72,176,0.2)");
    gradient.addColorStop(0.1, "rgba(72,72,176,0.0)");
    gradient.addColorStop(0, "rgba(119,52,169,0)");
  }

  return gradient;
}

export default {
  name: "BarChart",
  components: { Bar },
  data() {
    return {
      loaded: false,
      chartData: {
        labels: null,
        datasets: [
          {
            data: null,
            borderWidth: 2,
            borderColor: "#1d8cf8",
            backgroundColor: function (context) {
              const chart = context.chart;
              const { ctx, chartArea } = chart;

              if (!chartArea) {
                // This case happens on initial chart load
                return;
              }
              return getGradient(ctx, chartArea);
            },
            borderWidth: 2,
          },
        ],
      },
      chartOptions: {
        legend: {
          display: false,
        },
        responsive: true,
      },
    };
  },
  async mounted() {
    this.loaded = false;
    try {
      const response = await fetch("/api/fixed_cost");
      const fixedCost = await response.json();
      this.chartData.labels = Object.keys(fixedCost);
      this.chartData.datasets[0].data = Object.values(fixedCost);

      this.loaded = true;
    } catch (e) {
      console.error(e);
    }
  },
};
</script>
