<template>
  <Navbar />

  <!-- ✅ Show Main Directory -->
  <div v-if="!showForm && !showDelete">
    <div class="containerr">
      <h2>Employee Directory</h2>
      <p class="mb-4">
        Meet our talented team members who drive innovation and excellence at
        Modern Tech Solutions.
      </p>
    </div>

    <div class="container">
      <input
        v-model="searchQuery"
        type="text"
        placeholder="Search by name, position or department"
        class="search-bar"
      />
    </div>

    <section>
      <manage-comp
        v-for="employee in filteredEmployees"
        :key="employee.employeeId"
        :employee="employee"
      />
    </section>

    <div class="container">
      <button
        @click="showForm = true"
        class="btn btn-primary"
        style="margin-top: 20px"
      >
        Add Employee
      </button>
      <button
        @click="showDelete = true"
        class="btn btn-danger"
        style="margin-top: 20px; margin-left: 10px"
      >
        Delete Employee
      </button>
    </div>
  </div>

  <!-- ✅ Delete Dialog -->
  <div v-if="showDelete" class="delete-employee-dialog">
    <label for="deleteEmployeeSelect">Select employee to delete:</label>
    <select
      v-model="employeeToDeleteId"
      id="deleteEmployeeSelect"
      class="form-control"
    >
      <option disabled value="">Select employee...</option>
      <option
  v-for="emp in filteredEmployees"
  :key="emp.employeeId"
  :value="emp.employeeId"
>
  {{ emp.name }}
</option>
    </select>
    <div class="form-actions">
      <button
        :disabled="!employeeToDeleteId"
        @click="confirmDelete"
        class="btn btn-danger"
        style="margin-top: 10px"
      >
        Confirm Delete
      </button>
      <button
        @click="cancelDelete"
        class="btn btn-secondary"
        style="margin-top: 10px; margin-left: 10px"
      >
        Cancel
      </button>
    </div>
  </div>

  <!-- ✅ Add Employee Form -->
  <div v-if="showForm" class="overlay-form-container">
    <form @submit.prevent="submitForm" class="add-employee-form centered-form">
      <input v-model="form.name" placeholder="Name" required class="form-control" />
<input v-model="form.position" placeholder="Position" required class="form-control" />
<input v-model="form.department" placeholder="Department" required class="form-control" />
<input v-model="form.salary" placeholder="Salary" type="number" required class="form-control" />
<input v-model="form.email" placeholder="Email" required class="form-control" />
<input v-model="form.phone_number" placeholder="Phone Number" required class="form-control" />
<input v-model="form.hire_date" placeholder="Hire Date (YYYY-MM-DD)" required class="form-control" />
<input v-model="form.imageUrl" placeholder="Image URL" class="form-control" />
      <button type="submit" class="btn btn-success" style="margin-top: 10px">
        Add Employee
      </button>
      <button
        type="button"
        @click="showForm = false"
        class="btn btn-secondary"
        style="margin-top: 10px"
      >
        Cancel
      </button>
    </form>
  </div>
</template>



<script>
import ManageComp from "@/components/ManageComp.vue";
import { mapGetters } from "vuex";
import axios from 'axios';

export default {
  components: { ManageComp },
  data() {
    return {
      searchQuery: "",
      showForm: false,
      showDelete: false,
      employeeToDeleteId: "",
      form: {
        name: "",
      position: "",
      department: "",
      salary: "",
      email: "",
      phone_number: "",
      hire_date: "",
      imageUrl: "",
      },
    };
  },
  computed: {
    ...mapGetters(["employeeInfo"]),
    filteredEmployees() {
      if (!this.searchQuery) return this.employeeInfo;
      const query = this.searchQuery.toLowerCase();
      return this.employeeInfo.filter(emp =>
        emp.name.toLowerCase().includes(query) ||
        emp.position.toLowerCase().includes(query) ||
        emp.department.toLowerCase().includes(query)
      );
    },
  },
 mounted() {
  this.$store.dispatch('getEmployeeInfo');
},
 methods: {
  async submitForm() {
  try {
    await axios.post(`${process.env.VUE_APP_API_URL}/employee_information`, this.form);
    await this.$store.dispatch('getEmployeeInfo');
    this.showForm = false;
    this.form = {
      name: "",
      position: "",
      department: "",
      salary: "",
      email: "",
      phone_number: "",
      hire_date: "",
      imageUrl: "",
    };
  } catch (error) {
    alert('Failed to add employee');
  }
},
  async confirmDelete() {
  try {
    await axios.delete(`${process.env.VUE_APP_API_URL}/employee_information/${this.employeeToDeleteId}`);
    await this.$store.dispatch('getEmployeeInfo');
    this.employeeToDeleteId = "";
    this.showDelete = false;
  } catch (error) {
    alert('Failed to delete employee');
  }
},
    cancelDelete() {
      this.employeeToDeleteId = "";
      this.showDelete = false;
    },
  },
};
</script>
<style>
section {
  display: grid;
  grid-template-columns: repeat(4, 1fr);
  gap: 20px;
  width: 100%;
  box-sizing: border-box;
  overflow-x: hidden;
}
.employment-view {
  position: fixed;
  top: 0;
  left: 0;
  width: 100vw;
  height: 100vh;
  background-color: #219aea0f;
  z-index: -1;
}


@media (max-width: 1300px) {
  section {
    grid-template-columns: repeat(3, 1fr);
  }
}
@media (max-width: 900px) {
  section {
    grid-template-columns: repeat(2, 1fr);
  }
}
@media (max-width: 699px) {
  section {
    grid-template-columns: 1fr;
  }
}
.overlay-form-container {
  position: fixed;
  top: 0;
  left: 0;
  margin-top: auto;
  height: 100vh;
  width: 100vw;
  display: flex;
  justify-content: center;
  align-items: center;
  z-index: 1000;
  background: rgba(255,255,255,0.95);
  backdrop-filter: blur(5px);
  overflow-y: auto; 
}

.add-employee-form.centered-form {
  max-width: 350px;
  min-width: 260px;
  width: 100%;
  padding: 18px 16px;
  margin-top: 0;
  overflow-y: auto; 
}

.centered-form {
  max-width: 320px; /* smaller width */
  width: 100%;
  padding: 20px; /* add some padding */
  box-sizing: border-box;
}

.search-bar {
  margin-top: 20px; /* move up by decreasing this */
  padding: 10px;
  border: 1px solid #ccc;
  border-radius: 8px;
  width: 100%;
  /* max-width: 400px; */
  font-size: 16px;
  box-sizing: border-box;
}


.add-employee-form {
  background: #63897c;
  padding: 16px 20px;
  border-radius: 8px;
  box-shadow: 0 4px 16px rgba(0, 0, 0, 0.08);
  display: flex;
  flex-direction: column;
  gap: 10px;
  min-width: 400px;
  margin-top: 16px;
  width: 100%;
}
.action-buttons {
  display: flex;
  justify-content: center;
  gap: 10px;
  margin-bottom: 10px;
}
.delete-employee-dialog {
  background: #fff0f0;
  border: 1px solid #e57373;
  border-radius: 10px;
  padding: 20px 30px;
  margin: 20px auto 0 auto;
  max-width: 350px;
  display: flex;
  flex-direction: column;
  align-items: center;
}

.form-control {
  padding: 6px 10px;
  border-radius: 5px;
  border: 1px solid #ccc;
  font-size: 1em;
}

.form-actions {
  display: flex;
  gap: 10px;
  justify-content: flex-end;
}

.btn {
  padding: 8px 16px;
  margin-bottom: 20px;
  border-radius: 5px;
  border: none;
  font-size: 1em;
  cursor: pointer;
}

.btn-primary {
  background: #5990cc;
  color: #fff;
}

.btn-success {
  background: #567c95;
  color: #fff;
}

.btn-secondary {
  background: #6c757d;
  color: #fff;
}
.container {
  position: relative;
  text-align: center;
  margin-top: 20px;
  max-width: 100vw;
  overflow-x: hidden;
  box-sizing: border-box;
}
h2 {
  font-size: 2em;
  color: #333;
}
p {
  font-size: 1.2em;
  color: #666;
}

.containerr {
  position: relative;
  text-align: center;
  margin-top: 20px;
}
h2 {
  font-size: 2em;
  color: #000000;
}
p {
  font-size: 1.2em;
  color: #1c1c1c;
}

</style>
