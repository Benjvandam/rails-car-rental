import { Controller } from "@hotwired/stimulus"
// Connects to data-controller="navbar"
export default class extends Controller {

  static targets = ["myGarage","myBookings","ownerLinkText", "renterLinkText"]

  connect() {
    console.log(this.myGarageTarget)
    if (localStorage.getItem("ownerMode") === "true") {
      this.enableOwnerMode()
    } else{
      this.disableOwnerMode()
    }
  }

  enableOwnerMode() {
    this.myGarageTarget.classList.remove("d-none")
    this.ownerLinkTextTarget.classList.remove("d-none")
    this.myBookingsTarget.classList.add("d-none")
    this.renterLinkTextTarget.classList.add("d-none")

    localStorage.setItem("ownerMode", true)
  }

  disableOwnerMode() {
    this.myBookingsTarget.classList.remove("d-none")
    this.renterLinkTextTarget.classList.remove("d-none")
    this.myGarageTarget.classList.add("d-none")
    this.ownerLinkTextTarget.classList.add("d-none")

    localStorage.setItem("ownerMode", false)
  }
}
