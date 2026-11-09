<template>
  <div v-if="employee" class="payslip-container">
    <h3>
      Payslip for {{ employee.name }} (Employee {{ employee.Employee_Information_ID }})
    </h3>
    <ul>
      <li><strong>Hours Worked: </strong>{{ employee.hours_worked }}</li>
      <li><strong>Leave Deductions: </strong>{{ employee.leave_deductions }}</li>
      <li><strong>Final Salary: </strong>{{ employee.final_salary }}</li>
      <li><strong>Estimated Annual Income: </strong>{{ employee.estimated_annual_income }}</li>
    </ul>
  </div>
</template>
   

<script>
import { ref, onMounted, computed } from "vue";


export default {
  name: "Payslip",
  props: {
    employee: {
      type: Object,
      required: true,
    },
  },
  setup(props) {
    const payroll = ref(null);

    onMounted(async () => {
      try {
        const res = await fetch(`${process.env.VUE_APP_API_URL}/payroll/${props.employee.employeeId}`);
        const data = await res.json();
        payroll.value = data;
        console.log("Fetched payroll:", data);
      } catch (err) {
        console.error("Fetch error:", err);
      }
    });

    return {
      payroll,
      annualIncome: computed(() => {
        return payroll.value ? payroll.value.finalSalary * 12 : 0;
      }),
    };
  },
};
</script>


<style>
.payslip-container {
  max-width: 600px;
  margin: 2rem auto;
  padding: 2rem;
  background-color: #ffffff;
  border-radius: 12px;
  box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
  font-family: "Segoe UI", sans-serif;
  color: #2c3e50;
}

.payslip-container h3 {
  margin-bottom: 1rem;
  font-size: 1.5rem;
  border-bottom: 2px solid #3498db;
  padding-bottom: 0.5rem;
}

.payslip-container ul {
  list-style: none;
  padding: 0;
  margin: 0;
}

.payslip-container li {
  margin: 0.75rem 0;
  padding: 0.5rem 1rem;
  background-color: #f9f9f9;
  border-left: 4px solid #3498db;
  border-radius: 6px;
}

h1 h2 h3 h4 {
  color: #2199ea !important;
  text-align: center;
  margin-bottom: 30px;
}
</style>

