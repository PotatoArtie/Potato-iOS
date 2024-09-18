package kr.co.helloinpu.lottifiles_android

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.activity.enableEdgeToEdge
import androidx.compose.animation.AnimatedVisibility
import androidx.compose.animation.core.tween
import androidx.compose.foundation.Image
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.padding
import androidx.compose.material3.Scaffold
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.LaunchedEffect
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.tooling.preview.Preview
import com.airbnb.lottie.compose.LottieAnimation
import com.airbnb.lottie.compose.LottieCompositionSpec
import com.airbnb.lottie.compose.animateLottieCompositionAsState
import com.airbnb.lottie.compose.rememberLottieComposition
import kotlinx.coroutines.delay
import kr.co.helloinpu.lottifiles_android.ui.theme.Lottifiles_androidTheme

class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        setContent {
            Loader()
//            ImageAnimation()
        }
    }
}

@Composable
fun Loader() {
    val composition by rememberLottieComposition(LottieCompositionSpec.RawRes(R.raw.lottie_logo_1))
    val progress by animateLottieCompositionAsState(composition)
    LottieAnimation(
        composition = composition,
        progress = { progress },
    )
}


@Composable
fun ImageAnimation() {
    // 이미지 리소스를 리스트로 정의
    val imageList = listOf(
        R.drawable.loading01,
        R.drawable.loading02,
        R.drawable.loading03,
        R.drawable.loading04,
        R.drawable.loading05,
        R.drawable.loading06,
        R.drawable.loading07,
        R.drawable.loading08,
        R.drawable.loading09,
        R.drawable.loading10
    )

    var currentIndex by remember { mutableStateOf(0) }
    var isVisible by remember { mutableStateOf(true) }

    LaunchedEffect(currentIndex) {
        while (true) {
            delay(200)
            isVisible = false
            delay(0)
            currentIndex = (currentIndex + 1) % imageList.size // 다음 이미지로 변경
            isVisible = true
        }
    }

    // 이미지 애니메이션
    Box(
        contentAlignment = Alignment.Center
    ) {
        AnimatedVisibility(
            visible = isVisible,
            enter = androidx.compose.animation.fadeIn(animationSpec = tween(500)), // 페이드 인 애니메이션
            exit = androidx.compose.animation.fadeOut(animationSpec = tween(500)) // 페이드 아웃 애니메이션
        ) {
            Image(
                painter = painterResource(id = imageList[currentIndex]),
                contentDescription = "Animated Image"
            )
        }
    }
}
