
'''
A typical link given below fetch the daily historical data for
 the stock Apple Inc (AAPL is ticker symbol) from March,01,2018 
 to December 13,2018.
https://finance.yahoo.com/quote/AAPL/history?period1=1519842600&period2=1544639400&interval=1d&filter=history&frequency=1d
By changing ticker symbols and start and end dates you get the 
historical data for other stocks. You can also change frequency
 to weekly monthly by wk and mo.
The following links give all S&P 100 and S&P 500 companies 
list.
https://en.wikipedia.org/wiki/S%26P_100       
https://en.wikipedia.org/wiki/List_of_S%26P_500_companies
####################
1.	By using scraping tools download the last 1000 trading days 
historical data (daily, weekly and monthly) for all S&P500
 companies in to your system. Use parallelization to make download
 faster. (Note: Saturdays and Sundays and some festival days etc.
  are not trading days. The NYSE and NASDAQ average about 253 
  trading days a year)
'''


import bs4 as bs
import datetime as dt
import os
import pandas as pd
import pandas_datareader.data as web
import pickle
import requests


def save_sp500_tickers():
    resp = requests.get('https://en.wikipedia.org/wiki/List_of_S%26P_500_companies')

    soup = bs.BeautifulSoup(resp.text, "lxml")
    table = soup.find('table', {'class': 'wikitable sortable'})

    tickers = []

    for row in table.findAll('tr')[1:]:
        ticker = row.findAll('td')[0].text.strip()
        tickers.append(ticker)

    with open("sp500tickers.pickle", "wb") as f:
        pickle.dump(tickers, f)
        print(tickers)

    return tickers


def get_data_from_yahoo(reload_sp500=False):
    if reload_sp500:
        tickers = save_sp500_tickers()
    else:
        with open("sp500tickers.pickle", "rb") as f:
            tickers = pickle.load(f)

    if not os.path.exists('stock_dfs'):
        os.makedirs('stock_dfs')

    start = dt.datetime(2016, 1, 1)
    end = dt.datetime(2020, 12, 31)

    for ticker in tickers:

        print(ticker)

        if not os.path.exists('stock_dfs/{}.csv'.format(ticker)):
            try:
                df = web.DataReader(ticker, 'yahoo', start, end)
                df.to_csv('stock_dfs/{}.csv'.format(ticker))
            except Exception as ex:
                print('Error:', ex)
        else:
            print('Already have {}'.format(ticker))


get_data_from_yahoo(True)