//------------------------------------------------------------------------------
// The contents of this file are subject to the nopCommerce Public License Version 1.0 ("License"); you may not use this file except in compliance with the License.
// You may obtain a copy of the License at  http://www.nopCommerce.com/License.aspx. 
// 
// Software distributed under the License is distributed on an "AS IS" basis, WITHOUT WARRANTY OF ANY KIND, either express or implied. 
// See the License for the specific language governing rights and limitations under the License.
// 
// The Original Code is nopCommerce.
// The Initial Developer of the Original Code is NopSolutions.
// All Rights Reserved.
// 
// Contributor(s): _______. 
//------------------------------------------------------------------------------

using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Globalization;
using System.Text;
using System.Threading;
using System.Web;
using System.Web.Caching;
using System.Linq;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using AjaxControlToolkit;
using NopSolutions.NopCommerce.BusinessLogic;
using NopSolutions.NopCommerce.BusinessLogic.Configuration.Settings;
using NopSolutions.NopCommerce.BusinessLogic.Content.NewsManagement;
using NopSolutions.NopCommerce.BusinessLogic.Content.Polls;
using NopSolutions.NopCommerce.Common.Utils;
using NopSolutions.NopCommerce.BusinessLogic.Promo.Discounts;
using NopSolutions.NopCommerce.BusinessLogic.Infrastructure;

using System.Linq;
using NopSolutions.NopCommerce.BusinessLogic.Products;
using NopSolutions.NopCommerce.BusinessLogic.Categories;
using NopSolutions.NopCommerce.BusinessLogic.SEO;
using System.Collections.Generic;

namespace NopSolutions.NopCommerce.Web
{
    public partial class Default : BaseNopFrontendPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                BindData();
            }
        }

        protected void BindData()
        {
            bool showWelcomeMessageOnMainPage = this.SettingManager.GetSettingValueBoolean("Display.ShowWelcomeMessageOnMainPage");
            if (!showWelcomeMessageOnMainPage)
            {
                topicHomePageText.Visible = false;
            }
            FillGrid();
            
        }
        protected void dlSubCategories_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                var category = e.Item.DataItem as Category;
                string categoryURL = SEOHelper.GetCategoryUrl(category);

                var hlImageLink = e.Item.FindControl("hlImageLink") as HyperLink;
                if (hlImageLink != null)
                {
                    hlImageLink.ImageUrl = this.PictureService.GetPictureUrl(category.PictureId, this.SettingManager.GetSettingValueInteger("Media.Category.ThumbnailImageSize", 125), true);
                    hlImageLink.NavigateUrl = categoryURL;
                    hlImageLink.ToolTip = String.Format(GetLocaleResourceString("Media.Category.ImageLinkTitleFormat"), category.LocalizedName);
                    hlImageLink.Text = String.Format(GetLocaleResourceString("Media.Category.ImageAlternateTextFormat"), category.LocalizedName);
                }

                var hlCategory = e.Item.FindControl("hlCategory") as HyperLink;
                if (hlCategory != null)
                {
                    hlCategory.NavigateUrl = categoryURL;
                    hlCategory.ToolTip = String.Format(GetLocaleResourceString("Media.Category.ImageLinkTitleFormat"), category.LocalizedName);
                    hlCategory.Text = Server.HtmlEncode(category.LocalizedName);
                }
            }
        }
        private void FillGrid()
        {
            var categories = this.CategoryService.GetAllCategoriesDisplayedOnHomePage()
                .Where(x=>x.ParentCategoryId==0).ToList();//.GetAllCategories();

           // categories.ForEach(t => t.Name = t.ParentCategory.Name);

            //categories[0].


            this.rptrCategory.DataSource = categories;
            this.rptrCategory.DataBind();
        }

        protected void rptrCategory_OnRowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                var category = e.Row.DataItem as Category;
                DataList dl = e.Row.FindControl("dlSubCategories") as DataList;
                dl.DataSource = this.GetCategoryDataSource(category).Take(4);
                dl.DataBind();
            }
        }

        protected void rptrCategory_OnPageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            rptrCategory.PageIndex = e.NewPageIndex;
            FillGrid();
        }

        protected List<Category> GetCategoryDataSource(Category category)
        {
            ////page size
            //int totalRecords = 0;
            //int pageSize = 10;
            ////var category = this.CategoryService.GetCategoryById(categoryID);
            //if (category.PageSize > 0)
            //{
            //    pageSize = category.PageSize;
            //}

            ////price ranges
            //decimal? minPrice = null;
            //decimal? maxPrice = null;
            //decimal? minPriceConverted = null;
            //decimal? maxPriceConverted = null;
            //ProductSortingEnum orderBy = ProductSortingEnum.Position;

            ////var category = this.CategoryService.GetCategoryById(categories[0].CategoryId);
            ////featured products
            //var productCollection = this.ProductService.GetAllProductsDisplayedOnHomePage().Where(t=>t.ProductCategories.Count(x=>x.CategoryId==category.CategoryId) > 0).ToList();/* .GetAllProducts(category.CategoryId,
            //    0, 0, false, minPriceConverted, maxPriceConverted,
            //    string.Empty, false, pageSize, 0,
            //    null, orderBy, out totalRecords);*/
            //if (productCollection != null && productCollection.Count > 0)
            //    productCollection = productCollection.Take(4).ToList();
            //return productCollection;

      return    this.CategoryService.GetAllCategoriesByParentCategoryId(category.CategoryId);
         
        }
    }
}