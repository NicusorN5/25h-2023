using Android.Views;
using Android.Webkit;

namespace Hue25h
{
	[Activity(Label = "@string/app_name", MainLauncher = true)]
	public class MainActivity : Activity
	{
		WebView webView;

		class WebClient : WebViewClient
		{
			public override bool ShouldOverrideUrlLoading(WebView view, string url)
			{
				view.LoadUrl(url);
				return false;
			}
		}

		protected override void OnCreate(Bundle? savedInstanceState)
		{
			base.OnCreate(savedInstanceState);

			// Set our view from the "main" layout resource
			SetContentView(Resource.Layout.activity_main);

			webView = FindViewById<WebView>(Resource.Id.webView1);
			webView.Settings.JavaScriptEnabled = true;
			webView.SetWebViewClient(new WebClient());
			webView.LoadUrl("https://www.3dradspace.org");

			ActionBar.Hide();
		}
	}
}