from selenium import webdriver
import time
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.support.ui import Select
import datetime

chromeOptions = webdriver.ChromeOptions()
preferences = {"download.default_directory" : "G:\\MSIT\\1-1\\Data Science Specialization\\4.DADV\\Late Exam Submission\\Day"}
chromeOptions.add_experimental_option("prefs", preferences)
chromedriver = "C:\\Program Files\\Chrome\\chromedriver.exe"
browser = webdriver.Chrome(executable_path=chromedriver, options=chromeOptions)
browser.maximize_window()

url = "https://en.wikipedia.org/wiki/List_of_S%26P_500_companies"
browser.get(url)
time.sleep(2)

Companies_list = []
for i in range(1, 5):
	p = browser.find_element_by_xpath('//*[@id="constituents"]/tbody/tr['+str(i)+']/td[1]/a')
	Companies_list.append(p.text)
# print(len(Companies_list))
# print(Companies_list)

time.sleep(4)

#Time Conversion
Start_date = datetime.datetime(2017, 5, 11)
End_date = datetime.datetime(2020, 2, 5)
from_date = int(time.mktime(Start_date.timetuple()))
to_date = int(time.mktime(End_date.timetuple()))
print(from_date)
print(to_date)

for each in Companies_list:
    browser.get("https://finance.yahoo.com/quote/"+each+"/history?period1="+str(from_date)+"&period2="+str(to_date)+"&interval=1d&filter=history&frequency=1d")
    browser.find_element_by_xpath('//*[@id="Col1-1-HistoricalDataTable-Proxy"]/section/div[1]/div[2]/span[2]/a/span').click()
    time.sleep(3)

chromeOptions = webdriver.ChromeOptions()
preferences2 = {"download.default_directory" : "G:\\MSIT\\1-1\\Data Science Specialization\\4.DADV\\Late Exam Submission\\Week"}
chromeOptions.add_experimental_option("prefs", preferences2)
chromedriver2 = "C:\\Program Files\\Chrome\\chromedriver.exe"
browser = webdriver.Chrome(executable_path=chromedriver2, options = chromeOptions)

for each in Companies_list:
    browser.get("https://finance.yahoo.com/quote/"+each+"/history?period1="+str(from_date)+"&period2="+str(to_date)+"&interval=1d&filter=history&frequency=1wk")
    browser.find_element_by_xpath('//*[@id="Col1-1-HistoricalDataTable-Proxy"]/section/div[1]/div[2]/span[2]/a/span').click()
    time.sleep(3)

chromeOptions = webdriver.ChromeOptions()
preferences3 = {"download.default_directory" : "G:\\MSIT\\1-1\\Data Science Specialization\\4.DADV\\Late Exam Submission\\Month"}
chromeOptions.add_experimental_option("prefs", preferences3)
chromedriver3 = "C:\\Program Files\\Chrome\\chromedriver.exe"
browser = webdriver.Chrome(executable_path=chromedriver3, options = chromeOptions)

for each in Companies_list:
    browser.get("https://finance.yahoo.com/quote/"+each+"/history?period1="+str(from_date)+"&period2="+str(to_date)+"&interval=1d&filter=history&frequency=1m")
    browser.find_element_by_xpath('//*[@id="Col1-1-HistoricalDataTable-Proxy"]/section/div[1]/div[2]/span[2]/a/span').click()
    time.sleep(3)