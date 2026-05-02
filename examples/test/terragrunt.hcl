terraform {
  source = "../.."
}

inputs = {

  create = true

  tags = {create: "terraform"}
  name = "test-logset1"
  topics = {
    tke_pod = {
      topic_name = "tke_pod"
      describes = "topic and index for tke pod logs"
      auto_split = true
      max_split_partitions = 50
      partition_count      = 1
      period               = 30
      hot_period = 15
      storage_type         = "hot"
      topic_tags          = {topic: "tke_pod"}
      create_index = true
      idx = {
        rule = [{
          dynamic_index = [{
            status = false
          }
          ]
          full_text = [{
            tokenizer      = "@&()='\",;:<>[]{}/ \n\t\r"
            case_sensitive = false
            contain_z_h    = false
          }]
          key_value = [
            {
              case_sensitive = false
              key_values = [
                {
                  key = "__CONTENT__"
                  value = [{
                    contain_z_h = true
                    sql_flag    = true
                    tokenizer   = "@&?|#()='\",;:<>[]{}/ \n\t\r\\"
                    type        = "text"
                  }]
                }
              ]
            }
          ]
          tag = [
            {
              case_sensitive = false
              key_values = [
                {
                  key = "namespace"
                  value = [{
                    contain_z_h = false
                    sql_flag    = false
                    tokenizer   = "@&()='\",;:<>[]{}/ \n\t\r"
                    type        = "text"
                  }]
                },
                {
                  key = "pod_name"
                  value = [{
                    contain_z_h = false
                    sql_flag    = true
                    tokenizer   = "@&()='\",;:<>[]{}/ \n\t\r"
                    type        = "text"
                  }]
                },
                {
                  key = "container_name"

                  value = [{
                    contain_z_h = false
                    sql_flag    = false
                    tokenizer   = "@&()='\",;:<>[]{}/ \n\t\r"
                    type        = "text"
                  }]

                }
              ]
            }
          ]
        }]

        status                  = true
        include_internal_fields = false
        metadata_flag           = 0
      }
    },
    topic2 = {
      topic_name = "topic2"
      describes = "topic2"
      auto_split = true
      max_split_partitions = 50
      partition_count      = 1
      period               = 30
      hot_period = 15
      storage_type         = "hot"
      topic_tags          = {topic: "topic2"}
      create_index = false
    }
  }
}