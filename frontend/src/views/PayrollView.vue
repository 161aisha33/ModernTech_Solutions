<template>
  <Navbar />
  <div class="payroll">
    <h1><i>Compensation Information</i></h1>

    <!-- Add this wrapper -->
    <div class="table-container">
      <table class="custom-table">
        <thead>
          <tr>
            <th>Employee ID</th>
            <th>Name</th>
            <th>Hours Worked</th>
            <th>Leave Deductions</th>
            <th>Final Salary</th>
            <th>Payslip</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="employee in payrollData" :key="employee.employeeId">
            <td>{{ employee.employeeId }}</td>
            <td>{{ employee.name }}</td>
            <td>{{ employee.hoursWorked }}</td>
            <td>{{ employee.leaveDeductions }}</td>
            <td>{{ employee.finalSalary }}</td>
            <td>
              <button @click="viewPayslip(employee)">View Payslip</button>
            </td>
          </tr>
        </tbody>
      </table>
    </div>

    <div v-if="selectedEmployee" ref="payslipSection">
      <Payslip :employee="selectedEmployee" />
    </div>
  </div>
  <Footer />
</template>

<script setup>
import Navbar from "@/components/Navbar.vue";
import Footer from "@/components/Footer.vue";
</script>

<script>
import Payslip from "@/components/Payslip.vue";

export default {
  name: "PayrollView",
  components: { Payslip },
  data() {
    return {
      payrollData: [],
      selectedEmployee: null,
    };
  },
  methods: {
  async viewPayslip(employee) {
    console.log("Selected employee:", employee); // 👈 ADD THIS LINE
    try {
      const res = await fetch(`${process.env.VUE_APP_API_URL}/payroll/${employee.employeeId}`);
      const data = await res.json();

      this.selectedEmployee = {
        ...employee, // base info
        ...data      // overwrite/add payroll info
      };

      this.$nextTick(() => {
        const section = this.$refs.payslipSection;
        if (section && typeof section.scrollIntoView === "function") {
          section.scrollIntoView({ behavior: "smooth" });
        }
      });
    } catch (err) {
      console.error("Failed to fetch payslip data", err);
    }
  },
},
  mounted() {
  fetch(`${process.env.VUE_APP_API_URL}/payroll`)
    .then((res) => res.json())
    .then((data) => {
      console.log("Payroll Data Fetched:", data); // ✅ Add this
      this.payrollData = data;
    });
},
};
</script>
<style>
body {
  background-color: #f4f6f8;
  margin: 0;
  font-family: "Segoe UI", sans-serif;
}
.table-container {
  padding: 1rem;
  width: auto;
  margin:  auto;
}

.payroll {
  padding: 1rem;
}

.custom-table {
  width: 100%;
  border-collapse: separate;
  border-spacing: 0;
  margin-top: 1rem;
  font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
  box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
  background-color: #ffffff;
  border-radius: 8px;
  overflow: hidden;
}

.custom-table th {
  background-color: #345678;
  color: #ffffff;
  font-weight: 600;
  padding: 1rem;
  text-align: center;
  position: sticky;
  top: 0;
}

.custom-table td {
  text-align: center;
  border: 1px solid #dee2e6;
  background-color: #ffffff;
  color: #222;
}

.custom-table tr:nth-child(even) td {
  background-color: #f0f3f6;
}

.custom-table button {
  padding: 6px 14px;
  background-color: #4a90e2;
  color: #fff;
  border: none;
  border-radius: 20px;
  cursor: pointer;
  font-size: 14px;
  transition: background-color 0.3s ease;
}

.custom-table button:hover {
  background-color: #357ab8;
}

body {
  background-color: #f4f6f8;
  margin: 0;
  font-family: "Segoe UI", sans-serif;
}

.payroll {
  padding: 1rem;
}

/* Scrollable wrapper for small screens */
.table-container {
  width: 100%;
  overflow-x: auto;
  -webkit-overflow-scrolling: touch;
}

/* Main table styling */
.custom-table {
  width: 100%;
  min-width: 600px; /* Let it scroll if screen is narrower */
  border-collapse: separate;
  border-spacing: 0;
  margin-top: 1rem;
  font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
  box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
  background-color: #ffffff;
  border-radius: 8px;
  overflow: hidden;
}

/* Table headers */
.custom-table th {
  background-color: #345678;
  color: #ffffff;
  font-weight: 600;
  padding: 1rem;
  text-align: center;
  position: sticky;
  top: 0;
  white-space: nowrap;
}

/* Table cells */
.custom-table td {
  text-align: center;
  border: 1px solid #dee2e6;
  background-color: #ffffff;
  color: #222;
  padding: 0.8rem;
  white-space: normal;
  word-break: break-word;
}

/* Zebra striping */
.custom-table tr:nth-child(even) td {
  background-color: #f0f3f6;
}

/* Button styles */
.custom-table button {
  padding: 6px 14px;
  background-color: #4a90e2;
  color: #fff;
  border: none;
  border-radius: 20px;
  cursor: pointer;
  font-size: 14px;
  transition: background-color 0.3s ease;
}

.custom-table button:hover {
  background-color: #357ab8;
}

/* Responsive font and spacing */
@media (max-width: 600px) {
  .custom-table {
    font-size: 12px;
  }
  .payroll {
    padding: 0.5rem;
  }
}

@media (min-width: 601px) and (max-width: 1024px) {
  .custom-table {
    font-size: 14px;
  }
  .payroll {
    padding: 1rem;
  }
}

@media (min-width: 1025px) {
  .custom-table {
    font-size: 16px;
  }
  .payroll {
    padding: 2rem;
  }
}

</style>
