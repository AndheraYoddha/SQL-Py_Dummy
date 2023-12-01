"""
This application is used as a ledger for Tri|space Design OPC Pvt. Ltd
"""
import toga
from toga.style import Pack
from toga.style.pack import COLUMN, ROW

from toga.style.pack import *


class TriSpaceCrowdfund(toga.App):
    def startup(self):
        # Set up the main window
        self.main_window = toga.MainWindow(title=self.name)

        # Create a payment gateway
        payment_button = toga.Button('Pay with Google Pay', on_press=self.make_payment)
        payment_box = toga.Box(children=[payment_button], style=Pack(direction=ROW, padding=10))

        # Create a ROI calculator
        roi_label = toga.Label('Enter investment amount:')
        self.roi_input = toga.TextInput()
        roi_button = toga.Button('Calculate ROI', on_press=self.calculate_roi)
        roi_box = toga.Box(children=[roi_label, self.roi_input, roi_button], style=Pack(direction=ROW, padding=10))

        # Create a login page with database
        username_label = toga.Label('Username:')
        self.username_input = toga.TextInput()
        password_label = toga.Label('Password:')
        self.password_input = toga.PasswordInput()
        login_button = toga.Button('Log in', on_press=self.log_in)
        login_box = toga.Box(
            children=[username_label, self.username_input, password_label, self.password_input, login_button],
            style=Pack(direction=ROW, padding=10))

        # Create an admin console
        self.admin_label = toga.Label('Welcome, admin!')
        self.admin_box = toga.Box(children=[self.admin_label], style=Pack(direction=ROW, padding=10))

        # Create a backend ledger connected to SQL
        self.ledger = Ledger()

        # Create a property list with input for amount
        property1_button = toga.Button('Property 1', on_press=self.buy_property1)
        self.property1_amount_input = toga.TextInput()
        property1_box = toga.Box(children=[property1_button, self.property1_amount_input],
                                 style=Pack(direction=ROW, padding=10))

        property2_button = toga.Button('Property 2', on_press=self.buy_property2)
        self.property2_amount_input = toga.TextInput()
        property2_box = toga.Box(children=[property2_button, self.property2_amount_input],
                                 style=Pack(direction=ROW, padding=10))

        property3_button = toga.Button('Property 3', on_press=self.buy_property3)
        self.property3_amount_input = toga.TextInput()
        property3_box = toga.Box(children=[property3_button, self.property3_amount_input],
                                 style=Pack(direction=ROW, padding=10))

        property_list = toga.Box(children=[property1_box, property2_box, property3_box],
                                 style=Pack(direction=COLUMN, padding=10))

        # Add all the components to the main window
        self.main_window.content = toga.Box(children=[payment_box, roi_box, login_box, self.admin_box, property_list])

        # Show the main window
        self.main_window.show()

    def make_payment(self, widget):
        # TODO: Implement payment gateway
        pass

    def calculate_roi(self, widget):
        investment = float(self.roi_input.value)
        roi = self.ledger.calculate_roi(investment)
        toga.dialog.info('ROI', f'Your ROI is {roi:.2f}%')

    def log_in(self, widget):
        username = self.username_input.value
        password = self.password_input.value
        if self.ledger.verify_user(username, password):
            self.admin_label.text = f'Welcome, {username}!'
        else:
            toga.dialog.error('Login Error', 'Invalid username or password')

    def buy_property1(self, widget):
        amount = float(self.property1_amount_input.value)
        self.ledger.buy_property('Property 1', amount)
        toga.dialog.info('Purchase', 'Property 1 purchased successfully')

    def buy_property2(self, widget):
        amount = float(self.property2_amount_input.value)
        self.ledger.buy_property('Property 2', amount)
        toga.dialog.info('Purchase', 'Property 2 purchased successfully')

    def buy_property3(self, widget):
        amount = float(self.property3_amount_input.value)
        self.ledger.buy_property('Property 3', amount)
        toga.dialog.info('Purchase', 'Property 3 purchased successfully')


class Ledger:
    def __init__(self):
        # Connect to the SQL database
        # TODO: Implement SQL connection
        pass

    def calculate_roi(self, investment):
        # TODO: Implement ROI calculation
        return 0.0

    def verify_user(self, username, password):
        # TODO: Implement user verification with the database
        return False

    def buy_property(self, property_name, amount):
        # TODO: Implement property purchase and update the database
        pass


def main():
    return TriSpaceCrowdfund('TriSpace Crowdfund', 'com.example.trispacecrowdfund')


if __name__ == '__main__':
    app = main()
    app.main_loop()