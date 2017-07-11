#!py

def run():
  '''
  Create Properties File
  '''
  config = {}
  properties = __pillar__['properties']
  list_to_print = []
  prop = str()
  content = str()
  for key, value in properties.items():
    if isinstance(value, dict):
      prop = continue_loop(key, value)
      list_to_print.append(prop)
    else:
      prop = key + "=" + value
      list_to_print.append(prop)
  for item in list_to_print:
      content += item + "\n"
  config['/opt/spring-boot/config.properties'] = {
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

def continue_loop(prop_line, dict_object):
    for key, value in dict_object.items():
        if isinstance(value, dict):
            prop_line += "." + key
            return continue_loop(prop_line, value)
        else:
            prop_line += "." + key + "=" + value
            return prop_line
