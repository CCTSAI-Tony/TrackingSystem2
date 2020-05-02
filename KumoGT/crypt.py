import base64

#from cryptography.fernet import Fernet
#from cryptography.hazmat.backends import default_backend
#from cryptography.hazmat.primitives import hashes
#from cryptography.hazmat.primitives.kdf.pbkdf2 import PBKDF2HMAC

from Crypto.Cipher import AES
from binascii import b2a_hex, a2b_hex
import os
from django.conf import settings
from django.utils import six


def _get_setting(name):
    setting_name = "DEFF_{}".format(name)
    return os.getenv(setting_name, getattr(settings, setting_name, None))


def get_bytes(v):

    if isinstance(v, six.string_types):
        return bytes(v.encode("utf-8"))

    if isinstance(v, bytes):
        return v

    raise TypeError(
        "SALT & PASSWORD must be specified as strings that convert nicely to "
        "bytes."
    )

try:
    SALT = get_bytes(_get_setting("SALT"))
    PASSWORD = get_bytes(_get_setting("PASSWORD"))
except:
    SALT = get_bytes('random_salt_fh3d2945hf89')
    PASSWORD = get_bytes('random_password_v893hdsf785b4v')

# class Cryptographer(object):

#     #_fernet = Fernet(base64.urlsafe_b64encode(PBKDF2HMAC(
#     #    algorithm=hashes.SHA256(),
#     #    length=32,
#     #    salt=SALT,
#     #    iterations=100000,
#     #    backend=default_backend()
#     #).derive(PASSWORD)))
#     _cryptor = AES.new('This is a key123', AES.MODE_CBC, 'This is an iv456')

#     @classmethod
#     def encrypted(cls, content):         
#         return cls._cryptor.encrypt(content)
#         #return cls._fernet.encrypt(content)

#     @classmethod
#     def decrypted(cls, content):         
#         return cls._cryptor.decrypt(content)
#         #return cls._fernet.decrypt(content)


        
class Cryptographer(object):
    
    _cryptor = AES.new('This is a key123', AES.MODE_CBC, 'This is an iv456')

    @classmethod
    def encrypted(cls, content):
        length = 16
        count = len(content)
        add = length - (count % length)
        content = content + ('\0' * add)
        return b2a_hex(cls._cryptor.encrypt(content))

    @classmethod
    def decrypted(cls, content):
        
        plain_text = cls._cryptor.decrypt(a2b_hex(content))
        return plain_text.rstrip('\0')






