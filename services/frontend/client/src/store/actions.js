import { defineStore } from 'pinia';
import axios from 'axios';

console.log(import.meta.env);
const apiUrl = import.meta.env.VITE_API_URL;

export const useStore = defineStore('uStore', {
  state: () => ({
    messages: [],
  }),

  actions: {
    async sendMessage() {
      const data = await axios.post(`${apiUrl}/message`);
      this.messages = data.data;
    },
  },
});
