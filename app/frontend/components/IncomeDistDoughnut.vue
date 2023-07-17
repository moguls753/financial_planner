<template>
  <Doughnut id="my-chart-id" v-if="loaded" :options="chartOptions" :data="chartData" />
</template>

<script>
import { Doughnut } from "vue-chartjs";
import { Chart as ChartJS, ArcElement, Tooltip, Legend } from "chart.js";

ChartJS.register(Tooltip, Legend, ArcElement);
const colorArray = ["#42b88395", "#e14eca95", "#1d8cf895"];
ChartJS.overrides.doughnut.cutout = "70%";

export default {
  name: "IncomeDistDoughnut",
  components: { Doughnut },
  data() {
    return {
      loaded: false,
      chartData: {
        labels: null,
        datasets: [
          {
            data: null,
            borderColor: "#27293d",
            backgroundColor: null,
          },
        ],
      },
      chartOptions: {
        plugins: {
          legend: {
            display: true,
            labels: {
              color: "#ffffff",
            },
          },
        },
        responsive: true,
        maintainAspectRatio: false,
      },
    };
  },
  async mounted() {
    this.loaded = false;
    try {
      const response = await fetch("/api/income");
      const income = await response.json();
      this.chartData.labels = Object.keys(income);
      this.chartData.datasets[0].data = Object.values(income);
      this.chartData.datasets[0].backgroundColor = Object.keys(income).map(
        (_, i) => colorArray[i % 3]
      );

      this.loaded = true;
    } catch (e) {
      console.error(e);
    }
  },
};
</script>
