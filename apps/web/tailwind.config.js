/** @type {import('tailwindcss').Config} */
export default {
  content: [
    "./index.html",
    "./src/**/*.{js,ts,jsx,tsx}",
  ],
  theme: {
    extend: {
      colors: {
        brand: {
          pink: '#E98DA4',
          pinkHover: '#d87b92',
          pinkLight: '#fbe9ed',
          dark: '#2c3e50',
          gray: '#f4f6f8',
          text: '#4a4a4a',
          textLight: '#8a8a8a',
        }
      },
      fontFamily: {
        sans: ['Inter', 'sans-serif'],
      }
    },
  },
  plugins: [],
}
