#!py

def run():
  '''
  Create Properties File
  '''
  config = {}
  properties = __pillar__['spring']
  list_to_print = []
  prop = str()
  content = str()
  for key, value in properties['properties'].items():
    if isinstance(value, dict):
      prop = continue_loop(key, value, "")
      list_to_print.append(prop)
    else:
      prop = key + "=" + value
      list_to_print.append(prop)
  for item in list_to_print:
      content += item
  config['/opt/spring-boot/spring-boot-app/config.properties'] = {
     'file.managed': [
         {'user': "root"},
         {'group': "root"},
         {'makedirs': True},
         {'mode': 600},
         {'contents': content
         },
     ],
 }
  return config

def continue_loop(tree_keys, dict_object, prop_line):
    for key, value in dict_object.items():
        if isinstance(value, dict):
            tree_keys += "." + key
            return continue_loop(tree_keys, value, prop_line)
        else:
            prop_line += tree_keys + "." + key + " = " + str(value) + "\n"
    return prop_line
