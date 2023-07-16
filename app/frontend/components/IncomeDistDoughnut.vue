<template>
  <Doughnut id="my-chart-id" v-if="loaded" :options="chartOptions" :data="chartData" />
</template>

<script>
import { Doughnut } from "vue-chartjs";
import { Chart as ChartJS, ArcElement, Tooltip, Legend } from "chart.js";

ChartJS.register(Tooltip, Legend, ArcElement);

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
          },
        ],
      },
      chartOptions: {
        plugins: {
          legend: {
            display: false,
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
