<template>
  <Navbar />
  <div class='Review' id="app">
    <h1>Performance Reviews</h1>

    <!-- Wrap the table in a responsive scrollable container -->
    <div class="table-wrapper">
      <table class="review-table">
        <thead>
          <tr>
            <th>Employee</th>
            <th>Position</th>
            <th>Department</th>
            <th>Attendance (/10)</th>
            <th>Productivity (/10)</th>
            <th>Total (/20)</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="employee in employees" :key="employee.id">
  <td>{{ employee.employee_name }}</td>
  <td>{{ employee.position }}</td>
  <td>{{ employee.department }}</td>
  <td>{{ getAttendance(employee).toFixed(1) }}</td>
  <td>{{ getProductivity(employee).toFixed(1) }}</td>
  <td>{{ getTotal(employee).toFixed(1) }}</td>
</tr>
<tr v-if="employees.length === 0">
  <td colspan="6">No performance review data available</td>
</tr>

        </tbody>
      </table>
    </div>
  </div>
  <Footer />
</template>


<script setup>
import { ref, onMounted } from 'vue'
import Navbar from '@/components/Navbar.vue'
import Footer from '@/components/Footer.vue'

const employees = ref([])

onMounted(async () => {
  try {
    const res = await fetch(`${process.env.VUE_APP_API_URL}/performance`)
    if (!res.ok) throw new Error('Network response was not ok')
    const data = await res.json()
    console.log(' Performance reviews:', data)
    employees.value = data
  } catch (err) {
    console.error(' Failed to fetch performance data:', err)
  }
})

const getAttendance = (emp) => {
  const val = parseFloat(emp.attendance);
  return isNaN(val) ? 0 : val;
}

const getProductivity = (emp) => {
  const val = parseFloat(emp.productivity);
  return isNaN(val) ? 0 : val;
}

const getTotal = (emp) => {
  const val = parseFloat(emp.total);
  return isNaN(val) ? 0 : val;
}
</script>
<style>
.Review {
  padding: 1rem;
}

/* Scrollable container on small screens */
.table-wrapper {
  width: 100%;
  overflow-x: auto;
  -webkit-overflow-scrolling: touch;
}

/* Proper table structure with border radius only on outer corners */
.review-table {
  width: 100%;
  border-collapse: separate;
  border-spacing: 0;
  margin-top: 1rem;
  min-width: 600px;
  font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
  background-color: #ffffff;
  box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
  border-radius: 8px;
  overflow: hidden;
}

/* Standard table cells */
.review-table th,
.review-table td {
  padding: 1rem;
  text-align: center;
  border: 1px solid #dee2e6;
  color: #222;
  background-color: #ffffff;
  white-space: normal;
  word-break: break-word;
}

/* Header row */
.review-table th {
  background-color: #345678;
  color: #ffffff;
  font-weight: 600;
}

/* Zebra striping */
.review-table tr:nth-child(even) td {
  background-color: #f0f3f6;
}

/* Rounded corners only on outermost cells */
.review-table thead tr th:first-child {
  border-top-left-radius: 8px;
}
.review-table thead tr th:last-child {
  border-top-right-radius: 8px;
}
.review-table tbody tr:last-child td:first-child {
  border-bottom-left-radius: 8px;
}
.review-table tbody tr:last-child td:last-child {
  border-bottom-right-radius: 8px;
}

/* Responsive font sizes */
@media (max-width: 600px) {
  .review-table {
    font-size: 12px;
  }
  .Review {
    padding: 0.5rem;
  }
}

@media (min-width: 601px) and (max-width: 1024px) {
  .review-table {
    font-size: 14px;
  }
  .Review {
    padding: 1rem;
  }
}

@media (min-width: 1025px) {
  .review-table {
    font-size: 16px;
  }
  .Review {
    padding: 2rem;
  }
}

/* Button styling */
button {
  padding: 0.7rem 1.5rem;
  background-color: #345678;
  color: #ffffff;
  font-weight: bold;
  border: none;
  border-radius: 6px;
  margin-top: 1.5rem;
  cursor: pointer;
  transition: background-color 0.2s ease-in-out;
}

button:hover {
  background-color: #2b4564;
}

/* Ratings section */
.ratings h2 {
  color: #345678;
}

.ratings li {
  color: #444;
  font-size: 1.1rem;
}

</style>


