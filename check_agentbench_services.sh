#!/bin/bash

# 確認対象のサービスリスト (vLLMは除外)
SERVICES=(
    "agentbench-controller.service"
    "agentbench-worker-alfworld.service"
    "agentbench-worker-webshop.service"
    "agentbench-worker-dbbench.service"
    "agentbench-worker-os-interaction.service"
)

echo "=========================================="
echo " AgentBench サービス状態一括確認"
echo "=========================================="

for SERVICE in "${SERVICES[@]}"; do
    echo ""
    echo "▶ Checking: $SERVICE ..."
    
    # ステータス確認
    # --no-pager: スクロールモードにしない
    # -n 10: ログの最後の10行だけ表示（エラーが出てないか確認用）
    if sudo systemctl status $SERVICE --no-pager -n 10; then
        echo "✅ OK: $SERVICE is running"
    else
        echo "❌ ERROR: $SERVICE に問題がある可能性があります"
    fi
    echo "------------------------------------------"
done

echo "全ての確認が完了しました。"