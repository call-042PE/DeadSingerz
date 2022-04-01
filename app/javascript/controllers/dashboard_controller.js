import { Controller } from "@hotwired/stimulus"
import { Application } from "@hotwired/stimulus"
import Notification from "stimulus-notification"

const application = Application.start();

function getSinger(id) {
  var xhr = new XMLHttpRequest();

  return new Promise((resolve, reject) => {

    xhr.onreadystatechange = (e) => {
      if (xhr.readyState !== 4) {
        return;
      }

      if (xhr.status === 200) {
        resolve(JSON.parse(xhr.responseText));
      } else {
        console.warn('request_error');
      }
    };

    xhr.open('GET', `/api/get/singer/${id}`, false);
    xhr.send();
  });
}

export default class extends Controller {

  static targets = ["dashboard",
  "singer",
  "booking",
  "dashboardLink",
  "singerLink",
  "bookingLink",
  "accept",
  "decline",
  "waitingbooking",
  "acceptbooking",
  "userbooking",
  "notification"];

  connect() {
    this.startRefreshing()
  }

  disconnect() {
    this.stopRefreshing()
  }

  startRefreshing() {
    // waiting bookings ajax
    this.refreshTimer = setInterval(() => {
      let bErased = false;
      fetch("/api/get/waitingbookings")
      .then(response => response.json())
      .then((data) => {
        data.forEach((booking) => {
          getSinger(booking.singer_id)
          .then(singer => {
            if (bErased == false) {
              this.waitingbookingTarget.innerHTML = '';
              bErased = true;
            }
            this.waitingbookingTarget.insertAdjacentHTML("beforeend", `

              <div class="card card-background text-center" style="width: 22rem; background-image: linear-gradient(rgba(0, 0, 0, 0.3), rgba(0, 0, 0, 0.3)), url('http://res.cloudinary.com/ddkm6bg5l/image/upload/v1/production/${singer.key}')">
                <div class="column">
                  <div class="card-body">
                    <h5 class="card-title">${singer.name}</h5>
                  </div>

                </div>
              </div>
            `);
          })
        })
      })
    }, 1000)

    this.bookingTimer = setInterval(() => {
      let bErased = false;
      fetch("/api/get/userbookings")
      .then(response => response.json())
      .then((data) => {
        data.forEach((booking) => {
          getSinger(booking.singer_id)
          .then(singer => {
            if (bErased == false) {
              this.userbookingTarget.innerHTML = '';
              bErased = true;
            }
            this.userbookingTarget.insertAdjacentHTML("beforeend", `
            <div class="card card-background text-center" style="width: 22rem; background-image: linear-gradient(rgba(0, 0, 0, 0.3), rgba(0, 0, 0, 0.3)), url('http://res.cloudinary.com/ddkm6bg5l/image/upload/v1/production/${singer.key}')">
              <div class="column">
                <div class="card-body">
                  <h5 class="card-title">${singer.name}</h5>
                </div>
              </div>
            </div>
            `);
          })
        })
      })
    }, 1000);
  }

  stopRefreshing() {
    if (this.refreshTimer) {
      clearInterval(this.refreshTimer)
    }
    if (this.bookingTimer) {
      clearInterval(this.bookingTimer)
    }
  }

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

  decline(e) {
    e.preventDefault();
    fetch(e.target.href, {
      method: "DELETE",
      headers: {"Content-Type": "application/json"}
    });
    e.path[3].remove();
  }

  accept(e) {
    e.preventDefault();
    fetch(e.target.href, {
      method: "PUT",
      headers: {"Content-Type": "application/json"}
    });
    e.path[3].remove();
    this.notificationTarget.classList.remove("not-active");
    application.register("notification", Notification);
  }

}
