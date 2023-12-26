<template>
  <v-textarea
    class="area"
    label="Put your message here"
  >
  </v-textarea>

  <v-btn
    class="send_button"
  >
    Send
  </v-btn>
</template>

<script setup>

</script>

<style scoped>
.area {
  margin: 0 50px;
}
.send_button {
  margin-left: 50px;
  background-color: rgba(95, 158, 160, 0.57);
}
</style>
