variable "name" {
  type = string
  default = ""
  description = "TODO: naming convention"
}
variable "create" {
  type = bool
  default = true
  description = "create or not"
}
variable "region" {
  type = string
  default = "ap-jakarta"
}
variable "tags" {
  default = {}
  type = map(string)
  description = "tags for logset"
}
variable "topics" {
  default = {}
  type = any
  description = "top map with their indices for this logset, see `tencentcloud_cls_topic` and `tencentcloud_cls_index`"
}
