import { Controller } from "stimulus"
import Splide from '@splidejs/splide'

export default class extends Controller {
  connect() {
    this.slider()
  }

  slider() {
    document.querySelectorAll('.splide').forEach(splide => {
      return new Splide( splide, {
        gap: 20,
        perPage: 3,
        pagination: false,
        breakpoints: {
          640: {
            perPage: 2
          }
        }
      }).mount();
    })
  }
}
