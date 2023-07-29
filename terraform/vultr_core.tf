resource "vultr_ssh_key" "my_ssh_key" {
  name    = "klardotsh-1"
  ssh_key = trimspace(file("../resources/id_rsa.pub"))
  # ^ trimspace avoids a discrepancy between TF plan and actual state - Vultr
  # trims these server-side, and not trimming here results in a diff in the
  # plan on *every* deploy. noisy!
}
