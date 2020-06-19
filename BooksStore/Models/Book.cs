using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Microsoft.WindowsAzure.Storage.Auth;
using Microsoft.WindowsAzure.Storage.Table;
using Microsoft.WindowsAzure.Storage;
using Microsoft.WindowsAzure;
using Microsoft.Azure;
using Microsoft.WindowsAzure.Storage.Table.Queryable;

namespace BooksStore.Models
{
    public class Book
    {
    }

    public class BookEntity  : TableEntity
    {
        public int BookID { get; set; }
        public String BookTitle { get; set; }   
        public double BookPrice { get; set; }
    }

    public class BookDataSource
    {
        private CloudTable cloudTable = null;

        public BookDataSource()
        {
            CloudStorageAccount storageAccount = CloudStorageAccount.Parse(CloudConfigurationManager.GetSetting("DataConnectionString"));
            CloudTableClient clientTable = storageAccount.CreateCloudTableClient();
            cloudTable = clientTable.GetTableReference("Books");
            cloudTable.CreateIfNotExists();
        }

        public IEnumerable<BookEntity> GetBooks()
        {
            TableQuery<BookEntity> query = new TableQuery<BookEntity>();
            var result = cloudTable.ExecuteQuery(query);
            return result;
        }

        public void DeleteBook(int rowkey, string partitionkey)
        {
            TableOperation retrieveOperation = TableOperation.Retrieve<BookEntity>(partitionkey, rowkey.ToString());
            TableResult retrieveResult = cloudTable.Execute(retrieveOperation);
            BookEntity deleteBook = (BookEntity)retrieveResult.Result;
            TableOperation deleteOperation = TableOperation.Delete(deleteBook);
            cloudTable.Execute(deleteOperation);
        }

        public IEnumerable<BookEntity> Search(string search)
        {
            TableQuery<BookEntity> query = new TableQuery<BookEntity>();
            var result = cloudTable.ExecuteQuery(query);
            if (!String.IsNullOrEmpty(search))
            {
                result = result.Where(r => r.BookTitle.ToUpper().Contains(search.ToUpper()));
            }
            return result;
        }

        public void AddBook(BookEntity newBook)
        {
            TableOperation insertOperation = TableOperation.Insert(newBook);
            cloudTable.Execute(insertOperation);
        }

        public void Update(string bkId, string upBkTitle, string upBkPrice)
        {

        }
    }
}