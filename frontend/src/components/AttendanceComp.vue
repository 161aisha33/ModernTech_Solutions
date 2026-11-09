<template>
  <div class="attendance-system">
    <h1>Employee Records System</h1>
    <div class="side-by-side-main">
      <!-- Attendance Records System -->
      <div class="system-section">
        <h2>Attendance Records</h2>
        <div class="search-box">
          <select v-model="selectedAttendanceEmployeeId" @change="selectAttendanceEmployeeById" class="search-input">
            <option value="">Select employee...</option>
            <option v-for="emp in employees" :key="emp.employeeId" :value="emp.employeeId">
              {{ emp.name }}
            </option>
          </select>
        </div>
        <div v-if="attendanceEmployee" class="employee-form">
          <h3>{{ attendanceEmployee.name }}</h3>
          <table class="records-table attendance-table" v-if="attendanceEmployee.attendance.length > 0">

            <thead>
              <tr>
                <th>Date</th>
                <th>Status</th>
              </tr>
            </thead>
            <tbody>
  <tr v-for="(record, index) in attendanceEmployee.attendance" :key="index">
    <td>
      <input
        v-if="record.isNew"
        type="date"
        v-model="record.attendance_date"
        class="form-control"
      />
      <span v-else>{{ record.attendance_date }}</span>
    </td>
    <td>
      <select v-model="record.status" class="form-control">
        <option value="Present">Present</option>
        <option value="Absent">Absent</option>
      </select>
    </td>
  </tr>
</tbody>

          </table>
          <p v-else>No attendance records.</p>
          <button @click="saveAttendanceChanges" class="btn btn-success">Save Changes</button>
          <button @click="cancelAttendanceEdit" class="btn btn-secondary" style="margin-left:10px;">Cancel</button>
          <button @click="addNewAttendanceRow" class="btn btn-primary" style="margin-left:10px;">Add New Attendance</button>
        </div>
      </div>
      <!-- Leave Request System -->
      <div class="system-section">
        <h2>Leave Requests</h2>
        <div class="search-box">
          <select v-model="selectedLeaveEmployeeId" @change="selectLeaveEmployeeById" class="search-input">
            <option value="">Select employee...</option>
            <option v-for="emp in employees" :key="emp.employeeId" :value="emp.employeeId">
              {{ emp.name }}
            </option>
          </select>
        </div>
        <div v-if="leaveEmployee" class="employee-form">
          <h3>{{ leaveEmployee.name }}</h3>
          <div class="form-section">
            <table class="records-table" v-if="leaveEmployee.leaveRequests.length > 0">
              <thead>
                <tr>
                  <th>From Date</th>
                  <th>To Date</th>
                  <th>Reason</th>
                  <th>Status</th>
                </tr>
              </thead>
              <tbody>
                <tr v-for="(request, index) in leaveEmployee.leaveRequests" :key="index">
  <td>
    <input
      v-if="request.isNew"
      type="date"
      v-model="request.from_date"
      class="form-control"
    />
    <span v-else>{{ request.from_date }}</span>
  </td>
  <td>
    <input
      v-if="request.isNew"
      type="date"
      v-model="request.to_date"
      class="form-control"
    />
    <span v-else>{{ request.to_date }}</span>
  </td>
  <td>
    <select v-model="request.reason" class="form-control">
      <option value="Sick Leave">Sick Leave</option>
      <option value="Vacation">Vacation</option>
      <option value="Personal">Personal</option>
      <option value="Family Responsibility">Family Responsibility</option>
      <option value="Medical Appointment">Medical Appointment</option>
      <option value="Bereavement">Bereavement</option>
      <option value="Childcare">Childcare</option>
    </select>
  </td>
  <td>
    <select v-model="request.status" class="form-control">
      <option value="Pending">Pending</option>
      <option value="Approved">Approved</option>
      <option value="Rejected">Rejected</option>
    </select>
  </td>
</tr>
              </tbody>
            </table>
            <p v-else>No leave requests.</p>
          </div>
          <button @click="saveLeaveChanges" class="btn btn-success">Save Changes</button>
          <button @click="cancelLeaveEdit" class="btn btn-secondary" style="margin-left:10px;">Cancel</button>
          <button @click="addNewLeaveRow" class="btn btn-primary" style="margin-left:10px;">Add New Leave</button>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
import axios from "axios";
export default {
  name: "AttendanceAndLeave",
  props: {
    employees: {
      type: Array,
      required: true
    }
  },
  data() {
    return {
      selectedAttendanceEmployeeId: '',
      attendanceEmployee: null,
      selectedLeaveEmployeeId: '',
      leaveEmployee: null
    };
  },
  methods: {
    async selectAttendanceEmployee(employee) {
      const clone = JSON.parse(JSON.stringify(employee));
      try {
        const attendanceRes = await axios.get(`${process.env.VUE_APP_API_URL}/attendance/${employee.employeeId}`);
        clone.attendance = attendanceRes.data;
      } catch (error) {
        clone.attendance = [];
        console.error("Failed to fetch attendance:", error);
      }
      this.attendanceEmployee = clone;
    },
    selectAttendanceEmployeeById() {
      const emp = this.employees.find(e => e.employeeId == this.selectedAttendanceEmployeeId);
      if (emp) {
        this.selectAttendanceEmployee(emp);
      }
    },async saveAttendanceChanges() {
  try {
    const newRecords = this.attendanceEmployee.attendance.filter(r => r.isNew);
    for (const rec of newRecords) {
      await axios.post(`${process.env.VUE_APP_API_URL}/attendance`, {
      Employee_Information_ID: this.attendanceEmployee.employeeId,
      attendance_date: rec.attendance_date,
      status: rec.status  
    });
      rec.isNew = false;
    }
    // ... handle existing records (PUT) if needed ...
    alert("Attendance changes saved successfully!");
  } catch (error) {
    console.error("Failed to save attendance changes:", error);
    alert("Failed to save attendance changes.");
  }
},
    async saveLeaveChanges() {
  try {
    const newRequests = this.leaveEmployee.leaveRequests.filter(r => r.isNew);
    for (const req of newRequests) {
      console.log('Posting:', {
        employeeId: this.leaveEmployee.employeeId,
        from_date: req.from_date,
        to_date: req.to_date,
        reason: req.reason,
        status: req.status
      });
    await axios.post(`${process.env.VUE_APP_API_URL}/leave`, {
  Employee_Information_ID: this.leaveEmployee.employeeId,
  from_date: req.from_date,
  to_date: req.to_date,
  reason: req.reason,
  status: req.status
});


      req.isNew = false;
    }
    this.leaveEmployee = null;
this.selectedLeaveEmployeeId = '';

    // ... handle existing requests ...
  } catch (error) {
    console.error("Failed to save leave changes:", error);
    alert("Failed to save leave changes.");
  }
},addNewLeaveRow() {
  if (!this.leaveEmployee.leaveRequests) this.leaveEmployee.leaveRequests = [];
  this.leaveEmployee.leaveRequests.push({
    from_date: '',
    to_date: '',
    reason: 'Sick Leave',
    status: 'Pending',
    isNew: true
  });
},addNewAttendanceRow() {
  if (!this.attendanceEmployee.attendance) this.attendanceEmployee.attendance = [];
  this.attendanceEmployee.attendance.push({
    attendance_date: '',
    status: 'Present',
    isNew: true
  });
},
    cancelAttendanceEdit() {
      this.attendanceEmployee = null;
      this.selectedAttendanceEmployeeId = '';
    },
    async selectLeaveEmployee(employee) {
  const clone = JSON.parse(JSON.stringify(employee));
  try {
    const leaveRes = await axios.get(`${process.env.VUE_APP_API_URL}/leave/${employee.employeeId}`);
    clone.leaveRequests = leaveRes.data;
  } catch (error) {
    clone.leaveRequests = [];
    console.error("Failed to fetch leave requests:", error);
  }
  if (!Array.isArray(clone.leaveRequests)) clone.leaveRequests = [];
  this.leaveEmployee = clone;
}
,
    selectLeaveEmployeeById() {
      const emp = this.employees.find(e => e.employeeId == this.selectedLeaveEmployeeId);
      if (emp) {
        this.selectLeaveEmployee(emp);
      }
    },

    cancelLeaveEdit() {
      this.leaveEmployee = null;
      this.selectedLeaveEmployeeId = '';
    }
  }
};
</script>
<style scoped>
.attendance-system {
  max-width: 1500px;
  margin: 0 auto;
  padding: 2vw;
}
.side-by-side-main {
  display: flex;
  flex-wrap: wrap;
  gap: 30px;
}
.attendance-table th,
.attendance-table td {
  padding: 4px;
  font-size: 0.85rem;
}

.attendance-table .form-control {
  padding: 2px 6px;
  font-size: 0.85rem;
}

.attendance-table {
  width: 90%;
  margin: 0 auto 15px;
  table-layout: fixed;
}

.search-box {
  margin-bottom: 20px;
}
.search-input {
  width: 100%;
  padding: 8px;
  margin-top: 5px;
  border: 1px solid #2199EA;
  border-radius: 4px;
  font-size: 1rem;
}
.employee-form {
  background: #F9F9F9;
  padding: 20px;
  border-radius: 5px;
  margin-top: 20px;
}
.system-section {
  flex: 1;
  min-width: 450px;
  background: #F9F9F9;
  padding: 40px;
  border-radius: 5px;
}
.records-table {
  width: 100%;
  border-collapse: collapse;
  margin-bottom: 15px;
  padding-left: -8px;
}
.records-table th, .records-table td {
  border: 1px solid #ddd;
  padding: 8px;
  text-align: center;
}
.records-table th {
  background-color: #F2F2F2;
}
.form-control {
  width: 100%;
  padding: 1px;
}
.btn {
  padding: 5px 10px;
  margin-right: 5px;
  cursor: pointer;
  border-radius: 3px;
  border: none;
}
.btn-success {
  background-color: #28A745;
  color: white;
}
.btn-secondary {
  background-color: #6C757D;
  color: white;
}
</style>
