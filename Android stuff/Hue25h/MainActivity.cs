using Android.OS;
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
			webView.LoadUrl("http://192.168.0.21:3000/");

			ActionBar.Hide();

			TransparentStatusBar();
		}

		private void TransparentStatusBar()
		{
			if (Build.VERSION.SdkInt >= BuildVersionCodes.Kitkat)
			{
				// for covering the full screen in android..
				Window.SetFlags(WindowManagerFlags.LayoutNoLimits, WindowManagerFlags.LayoutNoLimits);

				// clear FLAG_TRANSLUCENT_STATUS flag:
				Window.ClearFlags(WindowManagerFlags.TranslucentStatus);

				Window.SetStatusBarColor(Android.Graphics.Color.Transparent);

			}

		}
	}
}