import json
import requests
from CmpUtils import CmpUtils


class APIUserLib(CmpUtils):
    def create_user(self, host, port, username, password, user):
        url = self._get_url('http://{host}:{port}/mobile/rest/users', host, port)
        headers = {'Content-Type': 'application/json'}
        payload = {
            'login': user.login,
            'password': user.password,
            'email': user.email,
            'firstName': user.firstName,
            'lastName': user.lastName,
            'enabled': user.enabled,
            'accountAdmin': user.accountAdmin,
            'liteUser': user.liteUser,
            'engageUser': user.engageUser,
            'accountId': user.accountId,
            'company': user.company,
            'jobTitle': user.jobTitle,
            'phone': user.phone,
            'address1': user.address1,
            'address2': user.address2,
            'country': user.country,
            'state': user.state,
            'zip': user.zip,
            'collaborateLogin': user.collaborateLogin,
            'autoRefreshEnabled': user.autoRefreshEnabled,
            'autoRefreshInterval': user.autoRefreshInterval
        }

        r = requests.put(url, data=json.dumps(payload), auth=(username, password), headers=headers)


        if r.status_code == 201:
            resp = r.json()
            return resp["userId"]

        raise Exception("Error Code, %i %s" % (r.status_code, r.text))

    def delete_user(self, host, port, username, password, userId):

        url = self._get_url('http://{host}:{port}/mobile/rest/users/', host, port)
        url = url + str(userId)

        r = requests.delete(url, auth=(username, password))

        if r.status_code == 202:
            resp = r.json()
            return resp["status"]

        raise Exception("Error Code, %i %s" % (r.status_code, r.text))

