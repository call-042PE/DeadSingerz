import { Controller } from "@hotwired/stimulus"
import { Application } from "@hotwired/stimulus"
import Notification from "stimulus-notification"

const application = Application.start()
application.register("notification", Notification)

export default class extends Controller {

  static targets = ["dashboard", "singer", "booking", "dashboardLink", "singerLink", "bookingLink"];

  dashboard(e) {
    e.preventDefault();
    this.dashboardLinkTarget.classList.add("link_active");
    this.singerLinkTarget.classList.remove("link_active");
    this.bookingLinkTarget.classList.remove("link_active");

    this.dashboardTarget.classList.add("active");
    this.dashboardTarget.classList.remove("not-active");

    this.singerTarget.classList.remove("active");
    this.singerTarget.classList.add("not-active");

    this.bookingTarget.classList.remove("active");
    this.bookingTarget.classList.add("not-active");
  }

  singers(e) {
    e.preventDefault();
    this.dashboardLinkTarget.classList.remove("link_active");
    this.singerLinkTarget.classList.add("link_active");
    this.bookingLinkTarget.classList.remove("link_active");

    this.singerTarget.classList.add("active");
    this.singerTarget.classList.remove("not-active");

    this.dashboardTarget.classList.remove("active");
    this.dashboardTarget.classList.add("not-active");

    this.bookingTarget.classList.remove("active");
    this.bookingTarget.classList.add("not-active");
  }

  bookings(e) {
    e.preventDefault();
    this.dashboardLinkTarget.classList.remove("link_active");
    this.singerLinkTarget.classList.remove("link_active");
    this.bookingLinkTarget.classList.add("link_active");

    this.bookingTarget.classList.add("active");
    this.bookingTarget.classList.remove("not-active");

    this.singerTarget.classList.remove("active");
    this.singerTarget.classList.add("not-active");

    this.dashboardTarget.classList.remove("active");
    this.dashboardTarget.classList.add("not-active");
  }

}
