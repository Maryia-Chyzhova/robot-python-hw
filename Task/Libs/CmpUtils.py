from suds.client import Client

class CmpUtils(object):

    @staticmethod
    def _get_url(url, host, port):
        return url.format(host=host, port=port)

    @staticmethod
    def _load_client_using_basic_authentication(username, password, url, timeout=None):
        if timeout:
            return Client(url, username=username, password=password, timeout=int(timeout))

        return Client(url, username=username, password=password)






