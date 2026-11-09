<template>
  <Navbar />
  <div class="employee-view">
    <div class="content-grid mt-5">
  
      <AttendanceComp :employees="employees" class="attendance-display" />
    </div>
  </div>
  <footer />
</template>

<script setup>
import { ref, onMounted } from "vue";
import axios from "axios";
import Navbar from "@/components/Navbar.vue";
import Footer from "@/components/Footer.vue";
import EmployeeComp from "@/components/EmployeeComp.vue";
import AttendanceComp from "@/components/AttendanceComp.vue";

const employees = ref([]);

async function fetchEmployees() {
  try {
    const response = await axios.get(`${process.env.VUE_APP_API_URL}/employee_information`);
    employees.value = response.data;
  } catch (error) {
    console.error("Failed to fetch employees:", error);
  }
}

async function handleAddEmployee(newEmployee) {
  try {
    await axios.post(`${process.env.VUE_APP_API_URL}/employee_information`, newEmployee);
    await fetchEmployees(); // Refresh the list after adding
  } catch (error) {
    console.error("Failed to add employee:", error);
  }
}

onMounted(() => {
  fetchEmployees();
});
</script>


<style scoped>
.employee-view {
  max-width: 1200px;
  margin: 0 auto;
  padding: 20px;
}

.employee-form h1 {
  color: #2199ea !important;
  text-align: center;
  margin-bottom: 30px;
}

h1 h2 h3 h4 {
  color: #2199ea !important;
  text-align: center;
  margin-bottom: 30px;
}
.content-grid {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 30px;
}

.content-grid > *:first-child {
  display: flex;
  flex-direction: column;
  align-items: center;
}

.content-grid {
  display: flex;
  flex-direction: column;
  gap: 30px;
}

.attendance-display {
  background-color: #eeeeee;
  padding: 20px;
  border-radius: 8px;
}

</style>
