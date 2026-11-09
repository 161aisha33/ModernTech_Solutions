<template>
    <div class="login d-flex justify-content-center align-items-center vh-100">
        <div class="box">
            <div></div>
            <div></div>
            <div></div>
            <div></div>
            <div></div>
            <div></div>
            <div></div>
            <div></div>
            <div></div>
            <div></div>
            
        </div>
        <form @submit.prevent="validatePassword">
            <div class="text-center">
                <img class="align-items-center" src="@/assets/IMG-20250623-WA0016.png" width="150" height="150">
            </div>

            <h1 class="mt-3 mb-5"><strong>Welcome Back</strong></h1>
            <label>Email Address:</label>
            <input type="email" v-model="email" placeholder="eg. name@example.com" required>

            <label class="mt-3">Password:</label>
            <input type="password" v-model="password" placeholder="Must be 8+ characters" required>

            <div v-if="errorMessage" class="text-danger">{{ errorMessage }}</div>

            <button class="button btn btn-primary mt-3" type="submit">Login</button>
        </form>
    </div>
</template>

<script>
import axios from 'axios';
export default {
    data() {
        return {
            email: '',
            password: '',
            errorMessage: ''
        };
    },
    methods: {
  async validatePassword() {
    try {
      const res = await axios.post(`${process.env.VUE_APP_API_URL}/login`, {
        email: this.email,
        password: this.password
      });

      localStorage.setItem('token', res.data.token);
      localStorage.setItem('role', res.data.role);

      this.$router.push('/employment'); // or conditional route by role
    } catch (error) {
      this.errorMessage = error.response?.data?.error || 'Login failed';
    }
  }
}
}
</script>

<style>
* {
  font-family: "Lato", "Trebuchet MS", "Lucida Sans Unicode", "Lucida Grande",
    "Lucida Sans", Arial, sans-serif;
  color: #0F5F96;
}
h1 {
  text-align: center;
}
form {
  /* max-width: 400px; */
  width: 800px;
  border: 1px solid;
  color: #2199EA;
  border-radius: 10px;
  padding: 10px;
  background-color: rgba(255, 255, 255, 0.762);
  margin: auto; /* Center form */
}
label {
  display: block;
  margin-bottom: 5px;
}
.button {
  display: block;
  width: 100%;
  height: 40px;
  letter-spacing: 0.5px;
  background-color: #0F5F96 !important;
  border: none;
  align-items: center;
  margin-top: 10px;
}
input {
  width: 100%;
  margin-bottom: 10px;
  height: 40px;
  color: #0F5F96;
}
.button:hover {
  background-color: #2199EA !important;
}
.login {
  height: 100vh;
  position: absolute;
  width: 100%;
  height: 100%;
  overflow: hidden;
  background: linear-gradient(
    90deg,
    rgba(2, 0, 0.6, 1) 0%,
    rgba(9, 9, 121, 1) 35%,
    rgba(0, 212, 255, 1) 100%
  );
}
.text-white {
  text-decoration: none;
} /* Responsive design for smaller screens */
@media (max-width: 600px) {
  form {
    margin: 20px; /* Add padding for mobile */
    border: none;
  }
  .button {
    height: 45px; /* Slightly larger button */
  }
  h1 {
    font-size: 1.5em; /* Adjust heading size */
  } /* Logo scaling */
  img {
    width: 120px; /* Smaller logo on mobile */
    height: auto;
  }
} /* Animated boxes */
.box div {
  position: absolute;
  width: 40px;
  height: 40px;
  background-color: transparent;
  border: 6px solid rgba(255, 255, 255, 0.8);
}
@media (max-width: 600px) {
  .box div {
    border: none;
  }
}
.box div:nth-child(1) {
  top: 3%;
  left: 25%;
  animation: animate 10s linear infinite;
}
.box div:nth-child(2) {
  top: 40%;
  left: 6%;
  animation: animate 7s linear infinite;
}
.box div:nth-child(3) {
  top: 5%;
  left: 60%;
  animation: animate 9s linear infinite;
}
.box div:nth-child(4) {
  top: 27%;
  left: 90%;
  animation: animate 10s linear infinite;
}
.box div:nth-child(5) {
  top: 67%;
  left: 10%;
  animation: animate 6s linear infinite;
}
.box div:nth-child(6) {
  top: 88%;
  left: 70%;
  animation: animate 6s linear infinite;
}
.box div:nth-child(7) {
  top: 60%;
  left: 80%;
  animation: animate 15s linear infinite;
}
.box div:nth-child(8) {
  top: 4%;
  left: 4%;
  animation: animate 12s linear infinite;
}
.box div:nth-child(9) {
  top: 90%;
  left: 25%;
  animation: animate 9s linear infinite;
}
.box div:nth-child(10) {
  top: 20%;
  left: 80%;
  animation: animate 5s linear infinite;
}
@keyframes animate {
  0% {
    transform: scale(0) translateY(0) rotate(0);
    opacity: 1;
  }
  1000% {
    transform: scale(1.3) translateY(-90px) rotate(360deg);
    opacity: 0;
  }
}
</style>