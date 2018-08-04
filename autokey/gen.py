import unicodedata
import json
import re

import yaml

def replchar(matchobj):
    s = unicode(matchobj.group(0), 'utf-8')
    return unicodedata.name(s).lower().replace(' ', '-')

def keystr_to_name(keystr):
    s = re.sub(r'[<>]', '', keystr)
    s = re.sub(r'[+]', '-', s)
    s = re.sub(r'[^-A-Za-z0-9]', replchar, s)
    return s

def autokey_json(name, keystr):
    modifiers = k.split('+')
    hotkey = modifiers.pop()
    return {
        "usageCount": 0,
        "omitTrigger": False,
        "prompt": False,
        "description": name,
        "abbreviation": {
            "wordChars": "[\\w]",
            "abbreviations": [],
            "immediate": False,
            "ignoreCase": False,
            "backspace": True,
            "triggerInside": False
        },
        "hotkey": {
            "hotKey": hotkey,
            "modifiers": modifiers
        },
        "modes": [3],
        "showInTrayMenu": False,
        "filter": {
            "regex": None,
            "isRecursive": False
        },
        "type": "script",
        "store": {}
    }

if __name__ == '__main__':
    config_data = yaml.load(open('keys.yml'))

    for k, v in config_data.items():
        name = keystr_to_name(k)

        with open('gen/.%s.json' % name, 'w') as f:
            j = autokey_json(name, k)
            f.write(json.dumps(j, indent=4))
            f.write("\n")

        with open('gen/%s.py' % name, 'w') as f:
            if isinstance(v, basestring):
                v = {"default": v}
            default = v["default"]
            del v["default"]
            if len(v) == 0:
                f.write("keyboard.send_keys('%s')\n" % default)
            else:
                first = True
                for app, key in v.items():
                    if first:
                        f.write("if ")
                        first = False
                    else:
                        f.write("elif ")
                    f.write("window.get_active_class() == '%s':\n" % app)
                    f.write("    keyboard.send_keys('%s')\n" % key)
                f.write("else:\n")
                f.write("    keyboard.send_keys('%s')\n" % default)
