data "template_file" "userdata" {
  template = "${file("${path.module}/run.sh")}"
}
