import random, string

class User(object):
    def __init__(self, login, password, firstName, lastName, accountId, email, enabled=None, accountAdmin=None, liteUser=None, engageUser=None, company=None,
                 jobTitle=None, phone=None, address1=None, address2=None, country=None, state=None, zip=None, collaborateLogin=None,
                 autoRefreshEnabled=None, autoRefreshInterval=None, userId=None):
        self.login = login
        self.password = password
        self.firstName = firstName
        self.lastName = lastName
        self.accountId = accountId
        self.email = email
        self.enabled = enabled
        self.accountAdmin = accountAdmin
        self.liteUser = liteUser
        self.engageUser = engageUser
        self.company = company
        self.jobTitle = jobTitle
        self.phone = phone
        self.address1 = address1
        self.address2 = address2
        self.country = country
        self.state = state
        self.zip = zip
        self.collaborateLogin = collaborateLogin
        self.autoRefreshEnabled = autoRefreshEnabled
        self.autoRefreshInterval = autoRefreshInterval
        self.userId = userId

    def __str__(self):
        return ("{0}".format(self.__dict__))

class UserCreation(object):
    def create_user_object(self, login=None, password=None, firstName=None, lastName=None, accountId=0, email=None, enabled=True,
                           accountAdmin=False, liteUser=None, engageUser=None, company=None, jobTitle=None, phone=None, address1=None,
                           address2=None, country=None, state=None, zip=None, collaborateLogin=None, autoRefreshEnabled=None, autoRefreshInterval=None, userId=None):
        login = login if login else self.__random_word(10)
        password = password if password else "U1"+self.__random_word(10, True)
        firstName = firstName if firstName else "FirstName " + login
        lastName = lastName if lastName else "LastName " + login
        email = email if email else login + "@clarabridge.com"

        return User(login, password, firstName, lastName, accountId, email, enabled, accountAdmin, liteUser, engageUser, company, jobTitle, phone, address1, address2,
                    country, state, zip, collaborateLogin, autoRefreshEnabled, autoRefreshInterval, userId)

    @staticmethod
    def __random_word(length, hasdigit=False):
        digit = ""
        if hasdigit:
            digit = '1234567890'
        return ''.join(random.choice(string.lowercase + string.uppercase + digit) for i in range(length))