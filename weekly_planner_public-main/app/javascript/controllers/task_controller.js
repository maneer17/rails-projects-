import { Controller } from "@hotwired/stimulus"
import 'bootstrap-datepicker'

export default class extends Controller {
  connect() {
    $('.datepicker').datepicker({format: 'yyyy-mm-dd'})
  }
}
