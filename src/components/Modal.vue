<template>
  <!-- The Modal -->
  <div v-if="active" class="modal" @click.prevent="closeModal">
    <!-- Modal content -->
    <div class="modal-content">
      <span class="close" @click.prevent="closeModal">×</span>
      <p>Some text in the Modal..</p>
      <button @click.prevent="closeModal">demo</button>
    </div>
  </div>
</template>

<script lang="ts">
import { Options, Vue } from "vue-class-component";

@Options({
  props: {
    active: Boolean,
  },
})
export default class Modal extends Vue {
  active = false;
  mounted() {
    console.log("Modal created");
  }
  closeModal() {
    console.log("close");
  }
}
</script>

<style lang="scss" scoped>
/* The Modal (background) */
.modal {
  display: block; /* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 99; /* Sit on top */
  padding-top: 100px; /* Location of the box */
  left: 0;
  top: 0;
  width: 100%; /* Full width */
  height: 100%; /* Full height */
  overflow: auto; /* Enable scroll if needed */
  background-color: rgb(0, 0, 0); /* Fallback color */
  background-color: rgba(0, 0, 0, 0.5); /* Black w/ opacity */
}

/* Modal Content */
.modal-content {
  background-color: #fefefe;
  margin: auto;
  padding: 20px;
  border: 1px solid #888;
  width: 80%;
}

/* The Close Button */
.close {
  color: #aaaaaa;
  float: right;
  font-size: 28px;
  font-weight: bold;
}

.close:hover,
.close:focus {
  color: #000;
  text-decoration: none;
  cursor: pointer;
}
</style>
