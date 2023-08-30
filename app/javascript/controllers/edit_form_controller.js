import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

// Connects to data-controller="edit-form"
export default class extends Controller {
  static targets = ['dropElement', 'calendarFrom', 'calendarUntil']
  connect() {
    console.log("evento ta rolando")
    flatpickr(this.calendarFromTarget);
    flatpickr(this.calendarUntilTarget);
  }
  fire(event) {
    this.dropElementTarget.classList.toggle('d-none');
  }
}
