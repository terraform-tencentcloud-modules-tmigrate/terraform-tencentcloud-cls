output "logset_name" {
  value = local.name
}

output "logset_id" {
  value = local.logset_id
}

output "topic_ids" {
  value = { for k, topic in tencentcloud_cls_topic.topics: k => topic.id}
}