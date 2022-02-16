import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = { key: String }

  connect() {
    console.log(this.keyValue)
    this.myfetch()
  }

  myfetch() {
    const token = `Bearer sl.${this.keyValue}`
    console.log(token)

    fetch("https://api.dropboxapi.com/2/users/get_current_account", {
      method: "POST",
      headers: {"Authorization": `${token}`}
    })
      .then(response => response.json())
      .then((data) => {
        console.log(data)
      })
  }
}
