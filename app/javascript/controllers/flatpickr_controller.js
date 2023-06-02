import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

export default class extends Controller {
  static targets = [ "startTime", "endTime" ]
  connect() {
    flatpickr(this.startTimeTarget, {
      dateFormat: "Y-m-d",
      disable: [
          {
              from: "1900-04-01",
              to: "2023-06-01"
          },
      ]
  })
    flatpickr(this.endTimeTarget, {
      dateFormat: "Y-m-d",
      disable: [
          {
              from: "1900-04-01",
              to: "2023-06-01"
          },
      ]
  })

  }
}
